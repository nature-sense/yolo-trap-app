import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'package:yolo_trap_app/src/interface.g.dart';
import 'detection_metadata.dart';
import 'messages.dart';

class BluetoothManager {
  static const String serviceUuid = "213E313B-D0DF-4350-8E5D-AE657962BB56";
  static const String previewStreamUuid = "8029922B-2E7E-4A16-8794-F74FC4915D16";
  static const String sessionListReqUuid = "C254EAAF-A9F3-4823-A022-1D817A11DE07";
  static const String sessionNotifUuid = "1319BC48-793D-4BB0-A4C6-D5001C629651";

  static const String detectionsListReqUuid = "997575F5-3ADF-48EB-BBF1-76221F12FF07";
  static const String detectionNotifUuid = "39AF506C-F6EA-4830-9CFC-592CE75F4D7F";
  static const String imageReqUuid = "F59CEF6F-8AF1-4636-AD8A-23CB2E12DA5D";
  static const String imageSegmentUuid = "8BF01881-CFBE-48B2-ACA6-F7F25C796943";

  static const String flowSetUuid = "1027C4DB-92F5-40ED-9A2D-25D53844D81C";
  static const String flowReqUuid = "F4A6C1ED-86FF-4C01-932F-7C810DC66B43";
  static const String flowNotifUuid = "FACEE39C-23F6-416E-8D03-E380F4E94B3E";

  static const String keepAliveUuid = "5C4F3C66-44A9-4C5C-95A1-7A3A3B5F71BD";

  BluetoothMethodsApi apiImpl = BluetoothMethodsApi();
  String? connectedDevice;
  ActiveFlow? flow;
  Map<String, BehaviorSubject<CharacteristicEvent>> subjectSubscriptions = {};

  BehaviorSubject<BluetoothState> bluetoothStateStream = BehaviorSubject();
  BehaviorSubject<ConnectionState> connectionStream = BehaviorSubject();
  BehaviorSubject<ScanEvent> scanStream = BehaviorSubject();

  BehaviorSubject<FrameHeaderMessage> previewHeaderStream = BehaviorSubject();
  BehaviorSubject<FrameSegmentMessage> previewSegmentStream = BehaviorSubject();

  BehaviorSubject<DetectionMetadata> detectionStream = BehaviorSubject();
  BehaviorSubject<StateMessage> stateNotifStream = BehaviorSubject();
  BehaviorSubject<ImageHeaderMessage> imageHeaderStream = BehaviorSubject();
  BehaviorSubject<ImageSegmentMessage> imageSegmentStream = BehaviorSubject();

  BehaviorSubject<NewSessionMessage> newSessionStream = BehaviorSubject();
  BehaviorSubject<DeleteSessionMessage> deleteSessionStream = BehaviorSubject();
  BehaviorSubject<SessionDetailsMessage> sessDetailsStream = BehaviorSubject();

  Stream<BluetoothStateEvent> pigeonBluetoothStateEvents = bluetoothStateEvents();
  Stream<ScanEvent> pigeonScanEvents = scanEvents();
  Stream<ConnectionEvent> pigeonConnectionEvents = connectionEvents();
  Stream<CharacteristicEvent> pigeonCharacteristicEvents = characteristicEvents();

  var logger = Logger();


  BluetoothManager() {
    // listen for bluetooth state events
    pigeonBluetoothStateEvents.listen((e) {
      bluetoothStateStream.add(e.state);
    });
    // listen for keep-alive



    // listen for connection/s
    pigeonConnectionEvents.listen((e) {
      switch (e.state) {
        case ConnectionState.connected:
          _onConnection();
          break;
        case ConnectionState.disconnected:
          connectedDevice = null;
          break;
        default:
      }
      connectionStream.add(e.state);
    });

    pigeonScanEvents.listen((e) => scanStream.add(e));
  }

  void getBluetoothState() async{
    var state = await apiImpl.getBluetoothState();
    bluetoothStateStream.add(state);
  }

  // fanout of characteristic events
  void _onConnection() {
    logger.d("Connected - starting connection based streams...");

    pigeonCharacteristicEvents.listen((e) {
      //logger.d("Received characteristic ${e.characteristicId}");

      switch (e.characteristicId) {
        case previewStreamUuid:
          var frmMsg = FrameMessage.fromProto(e.data);
          if(frmMsg.header != null) {
            previewHeaderStream.add(frmMsg.header!);
          } else if(frmMsg.segment != null) {
            previewSegmentStream.add(frmMsg.segment!);
          }
          break;

        case imageSegmentUuid:
          var imgMsg = ImageMessage.fromProto(e.data);
          if(imgMsg.header != null) {
            imageHeaderStream.add(imgMsg.header!);
          } else if(imgMsg.segment != null) {
            imageSegmentStream.add(imgMsg.segment!);
          }
          break;

        case detectionNotifUuid:
          detectionStream.add(DetectionMetadataMessage.fromProto(e.data));
          break;

        case sessionNotifUuid:
          var sessMsg = SessionMessage.fromProto(e.data);
          if(sessMsg.newSession != null) {
            newSessionStream.add(sessMsg.newSession!);
          } else if(sessMsg.deleteSession != null) {
            deleteSessionStream.add(sessMsg.deleteSession!);
          } else if(sessMsg.detailsMessage != null) {
            sessDetailsStream.add(sessMsg.detailsMessage!);
          }
          break;

        case flowNotifUuid:
          stateNotifStream.add(StateMessage.fromProto(e.data));
          break;

        case keepAliveUuid:
          //logger.d("Keep alive");
          break;
      }
    });
    apiImpl.subscribeCharacteristic(connectedDevice!, serviceUuid, previewStreamUuid);
    apiImpl.subscribeCharacteristic(connectedDevice!, serviceUuid, sessionNotifUuid);
    apiImpl.subscribeCharacteristic(connectedDevice!, serviceUuid, detectionNotifUuid);
    apiImpl.subscribeCharacteristic(connectedDevice!, serviceUuid, imageSegmentUuid);
    apiImpl.subscribeCharacteristic(connectedDevice!, serviceUuid, flowNotifUuid);
    apiImpl.subscribeCharacteristic(connectedDevice!, serviceUuid, keepAliveUuid);

  }

  void startScanning() async => await apiImpl.startScanning(serviceUuid);
  void stopScanning() async => await apiImpl.stopScanning();

  void connect(String deviceId) async {
    connectedDevice = deviceId;
    apiImpl.connect(deviceId, serviceUuid);
  }

  void disconnect() async {
    apiImpl.disconnect(connectedDevice!);
  }

  void setFlow(ActiveFlow flow) => apiImpl.writeCharacteristic(
    connectedDevice!,
    serviceUuid,
    flowSetUuid,
    Uint8List.fromList([flow.value]),
  );

  void publishFlow() => apiImpl.writeCharacteristic(
    connectedDevice!,
    serviceUuid,
    flowReqUuid,
    Uint8List.fromList([0]),
  );

  void publishDetections() => apiImpl.writeCharacteristic(
    connectedDevice!,
    serviceUuid,
    detectionsListReqUuid,
    Uint8List.fromList([0]),
  );

  void publishSessions() => apiImpl.writeCharacteristic(
    connectedDevice!,
    serviceUuid,
    sessionListReqUuid,
    Uint8List.fromList([0]),
  );

  void publishImageSegments(String session, int detection) {
    var msg = DetectionReferenceMessage(session, detection).toProto();
    apiImpl.writeCharacteristic(
      connectedDevice!,
      serviceUuid,
      imageReqUuid,
      msg,
    );
  }
}
