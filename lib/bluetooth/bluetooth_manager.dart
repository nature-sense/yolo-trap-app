import 'dart:async';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/image/image_cache.dart';
import 'package:yolo_trap_app/models/detections_model.dart';
import 'package:yolo_trap_app/models/trap_state_model.dart';

import 'package:yolo_trap_app/src/interface.g.dart';
import 'package:yolo_trap_app/models/bluetooth_state_model.dart';
import 'package:yolo_trap_app/models/connection_state_nodel.dart';

import '../models/preview_frame_model.dart';
import '../models/scan_model.dart';
import '../models/sessions_model.dart';
import 'messages.dart';

class BluetoothManager {
  static const String serviceUuid = "213E313B-D0DF-4350-8E5D-AE657962BB56";
  static const String previewStreamUuid =
      "8029922B-2E7E-4A16-8794-F74FC4915D16";
  static const String sessionListReqUuid =
      "C254EAAF-A9F3-4823-A022-1D817A11DE07";
  static const String sessionNotifUuid = "1319BC48-793D-4BB0-A4C6-D5001C629651";

  static const String detectionsListReqUuid =
      "997575F5-3ADF-48EB-BBF1-76221F12FF07";
  static const String detectionNotifUuid =
      "39AF506C-F6EA-4830-9CFC-592CE75F4D7F";
  static const String imageReqUuid = "F59CEF6F-8AF1-4636-AD8A-23CB2E12DA5D";
  static const String imageSegmentUuid = "8BF01881-CFBE-48B2-ACA6-F7F25C796943";

  static const String flowSetUuid = "1027C4DB-92F5-40ED-9A2D-25D53844D81C";
  static const String flowReqUuid = "F4A6C1ED-86FF-4C01-932F-7C810DC66B43";
  static const String trapStateNotifUuid = "FACEE39C-23F6-416E-8D03-E380F4E94B3E";

  static const String keepAliveUuid = "5C4F3C66-44A9-4C5C-95A1-7A3A3B5F71BD";

  BluetoothMethodsApi apiImpl = BluetoothMethodsApi();
  //late ImageManager imageManager;
  String? connectedDevice;
  ActiveFlow? flow;

  var logger = Logger();

  BluetoothManager() {

    bluetoothStateEvents().listen((e) =>
        di<BluetoothStateModel>().setState(e.state));
    getBluetoothState();

    logger.d("Listening for scan events");

    scanEvents().listen((e) {
      logger.d("Scan event for ${e.deviceId}");
      di<ScanModel>().addPeripheral(e.deviceId);
    });

    connectionEvents().listen((e) {
      if(e.state == ConnectionState.connected) {
        _onConnected();
      }
      di<ConnectionStateModel>().setState(e.state);
    });
  }
  void _onConnected() {
    characteristicEvents().listen((e) {
      switch (e.characteristicId) {
        case previewStreamUuid:
          var frmMsg = FrameMessage.fromProto(e.data);
          if (frmMsg.header != null) {
            di<PreviewFrameModel>().addHeader(frmMsg.header!);
          } else if (frmMsg.segment != null) {
            di<PreviewFrameModel>().addSegment(frmMsg.segment!);
          }
          break;

        case imageSegmentUuid:
          var imgMsg = ImageMessage.fromProto(e.data);
         if (imgMsg.header != null) {
            logger.d(
              "Image header ${imgMsg.header!.session} ${imgMsg.header!
                  .detection}",
            );
            di<ImageCache>().addHeader(imgMsg.header!);

          } else if (imgMsg.segment != null) {
            logger.d(
              "Image segment  ${imgMsg.segment!.session} ${imgMsg.segment!
                  .detection} ${imgMsg.segment!.segment}",
            );
            di<ImageCache>().addSegment(imgMsg.segment!);
          }
          break;

        case detectionNotifUuid:
          logger.d("Received detectionNotifUuid");
          di<DetectionsModel>().addDetection(
              DetectionMetadataMessage.fromProto(e.data));
          break;

        case sessionNotifUuid:
          var sessMsg = SessionMessage.fromProto(e.data);
          if (sessMsg.newSession != null) {
            di<SessionsModel>().newSession(
                Session(sessMsg.newSession!.session, 0));
          } else if (sessMsg.deleteSession != null) {
            di<SessionsModel>().deleteSession(sessMsg.deleteSession!.session);
          } else if (sessMsg.detailsMessage != null) {
            di<SessionsModel>().updateSession((Session(
                sessMsg.detailsMessage!.session,
                sessMsg.detailsMessage!.detections)));
          }
          break;

        case trapStateNotifUuid:
          logger.d("Received trapStateNotifUuid");
          var state = StateMessage.fromProto(e.data);
          di<TrapStateModel>().setState(state.activeFlow, state.storageMounted);
          break;

        case keepAliveUuid:
        //logger.d("Keep alive");
          break;
      }});

      apiImpl.subscribeCharacteristic(
        connectedDevice!,
        serviceUuid,
        previewStreamUuid,
      );
      apiImpl.subscribeCharacteristic(
        connectedDevice!,
        serviceUuid,
        sessionNotifUuid,
      );
      apiImpl.subscribeCharacteristic(
        connectedDevice!,
        serviceUuid,
        detectionNotifUuid,
      );
      apiImpl.subscribeCharacteristic(
        connectedDevice!,
        serviceUuid,
        imageSegmentUuid,
      );
      apiImpl.subscribeCharacteristic(
        connectedDevice!,
        serviceUuid,
        trapStateNotifUuid,
      );
      apiImpl.subscribeCharacteristic(
        connectedDevice!,
        serviceUuid,
        keepAliveUuid,
      );

      publishState();
  }

  void getBluetoothState() async {
    var state = await apiImpl.getBluetoothState();
    logger.d("getBluetoothState() - $state");
    di<BluetoothStateModel>().setState(state);
  }

  void startScanning() async {
    di<ScanModel>().clear();
    await apiImpl.startScanning(serviceUuid);
  }
  void stopScanning() async {
    await apiImpl.stopScanning();
    di<ScanModel>().clear();
  }

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

  void publishState() => apiImpl.writeCharacteristic(
    connectedDevice!,
    serviceUuid,
    flowReqUuid,
    Uint8List.fromList([0]),
  );

  void publishDetections(String session) {
    di<DetectionsModel>().clear();
    var message = DetectionsForSessionMessage(session);
    apiImpl.writeCharacteristic(
      connectedDevice!,
      serviceUuid,
      detectionsListReqUuid,
      Uint8List.fromList(message.toProto()),
    );
  }

  void publishSessionsList() {
    di<SessionsModel>().clear();
    apiImpl.writeCharacteristic(
      connectedDevice!,
      serviceUuid,
      sessionListReqUuid,
      Uint8List.fromList([0]),
    );
  }

  void publishImageSegments(String session, int detection) {
    logger.d("GET IMAGE $session $detection");
    var msg = DetectionReferenceMessage(session, detection).toProto();
    apiImpl.writeCharacteristic(
      connectedDevice!,
      serviceUuid,
      imageReqUuid,
      msg,
    );
  }
}
