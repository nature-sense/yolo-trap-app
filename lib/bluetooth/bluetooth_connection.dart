import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';
import 'package:yolo_trap_app/bluetooth/uuids.dart';

import 'image_manager.dart';
import 'messages.dart';
import 'package:yolo_trap_app/globals.dart';

enum ConnectionState { offline, connecting, connected }

class BluetoothConnection {
  ConnectionState state = ConnectionState.offline;
  final logger = Logger();

  final BehaviorSubject<bool> bluetoothSubject = BehaviorSubject.seeded(false);
  final BehaviorSubject<ConnectionState> connectionSubject = BehaviorSubject
      .seeded(ConnectionState.offline);

  final BehaviorSubject<bool> scanStateSubject = BehaviorSubject.seeded(false);
  final PublishSubject<ScanResult> scanResultsStream = PublishSubject();

  final BehaviorSubject<TrapState> trapStateSubject = BehaviorSubject();

  final PublishSubject<NewSessionMessage> newSessionStream = PublishSubject();
  final PublishSubject<
      DeleteSessionMessage> deleteSessionStream = PublishSubject();
  final PublishSubject<
      SessionDetailsMessage> sessionDetailsStream = PublishSubject();

  final PublishSubject<DetectionMetadata> detectionsStream = PublishSubject();
  final PublishSubject<DetectionMetadata> previewStream = PublishSubject();

  StreamSubscription<List<int>>? sessionSubscribe;

  late int mtu;
  Map svcMap = {};
  Map charMap = {};

  bool bluetoothState = false;
  bool connectionState = false;
  BluetoothDevice? device;

  late ImageManager imageManager;

  BluetoothCharacteristic stateReqCharacteristic() =>
      charMap[Uuids.stateReqUuid]!;

  BluetoothCharacteristic setFlowCharacteristic() =>
      charMap[Uuids.flowSetUuid]!;

  BluetoothCharacteristic stateCharacteristic() =>
      charMap[Uuids.stateNotifUuid]!;

  BluetoothCharacteristic sessionListReqCharacteristic() =>
      charMap[Uuids.sessionListReqUuid]!;

  BluetoothCharacteristic sessionListEntryCharacteristic() =>
      charMap[Uuids.sessionNotifUuid]!;

  BluetoothCharacteristic detectionsListReqCharacteristic() =>
      charMap[Uuids.detectionsListReqUuid];

  BluetoothCharacteristic detectionNotifCharacteristic() =>
      charMap[Uuids.detectionNotifUuid];

  BluetoothCharacteristic imageReqCharacteristic() =>
      charMap[Uuids.imageReqUuid]!;

  BluetoothCharacteristic imageSegmentCharacteristic() =>
      charMap[Uuids.imageSegmentUuid]!;

  BluetoothCharacteristic previewStreamCharacteristic() =>
      charMap[Uuids.previewStreamUuid]!;

  void initBluetooth() async {
    logger.d("Initialising Bluetooth");

    if (await FlutterBluePlus.isSupported == false) {
      print("Bluetooth not supported by this device");
      return;
    }

    bluetoothSubject.add(false);
    //imageFetcher();

    // Listen for the Bluetooth adapter to come online
    FlutterBluePlus.adapterState.listen((state) {
      if (state == BluetoothAdapterState.on) {
        bluetoothSubject.add(true);
        bluetoothState = true;
        logger.d("Bluetooth is online");
      } else {
        bluetoothSubject.add(false);
        bluetoothState = false;
        logger.d("Bluetooth is offline");
      }
    });
  }

  void subscribeToScanResults() => scanResultsStream;

  void scan() async {
    //scanStream.sink.add(false); // not scanning

    if (bluetoothState) {
      // When the adapter is online set up a listener for the scan resultss
      // and start scanning. Publish the results to the scan stream
      var subscription = FlutterBluePlus.scanResults.listen((results) {
        for (ScanResult result in results) {
          scanResultsStream.sink.add(result);
        }
      });
      // Listen to the scanning state and publish changes to scanStateStream
      FlutterBluePlus.isScanning.listen(
            (state) => scanStateSubject.add(state),
      );
      await FlutterBluePlus.startScan(
          withServices: [Guid("213e313b-d0df-4350-8e5d-ae657962bb56")]
        //timeout: Duration(seconds: 30),
      );
      FlutterBluePlus.cancelWhenScanComplete(subscription);
    } else {
      logger.d("Bluetooth is $state");
    }
  }

  void connect(BluetoothDevice device) async {
    this.device = device;

    state = ConnectionState.connecting;
    connectionSubject.sink.add(state);

    FlutterBluePlus.events.onConnectionStateChanged.listen((event) async {
      if (event.connectionState == BluetoothConnectionState.connected) {
        logger.d('${event.device} ${event.connectionState}');

        var subscr = device.mtu.listen((int m) {
          logger.d("mtu = $m");
          mtu = m;
        });
        device.cancelWhenDisconnected(subscr);

        await device.discoverServices().then((services) {
          svcMap = {for (var s in services) s.serviceUuid.toString(): s};
          assert(svcMap.containsKey(Uuids.serviceUuid));
          //var service = svcMap[serviceUuid]!;
          charMap = {
            for (var c in svcMap[Uuids.serviceUuid]!.characteristics)
              c.characteristicUuid.toString(): c,
          };

          logger.d("Create and run the image manager");
          imageManager = ImageManager(this);
          imageManager.run();

          logger.d("Bluetooth connected and discovered");
          state = ConnectionState.connected;
          connectionState = true;
          connectionSubject.add(state);

          device.onServicesReset.listen((_) {
            final SnackBar snackBar = SnackBar(
                content: Text("Connection lost"));
            snackbarKey.currentState?.showSnackBar(snackBar);
            device.disconnect();
            state = ConnectionState.offline;
            connectionSubject.add(state);
          });
        });
      } else {
        if (connectionState) {
          final SnackBar snackBar = SnackBar(content: Text("Connection lost"));
          snackbarKey.currentState?.showSnackBar(snackBar);
          logger.d("Device disconnected");
          connectionState = false;
          state = ConnectionState.offline;
          connectionSubject.add(state);
        }
      }
    });
    logger.d("Connecting....");
    device.connect();
  }

  void disconnect() {
    if (device != null) {
      device!.disconnect();
      logger.d("Device disconnected");
      connectionState = false;
      state = ConnectionState.offline;
      connectionSubject.add(state);
    }
  }


  void setFlow(ActiveFlow flow) {
    BluetoothCharacteristic characteristic = setFlowCharacteristic();
    characteristic.write([flow.value]);
  }

  void subscribeTrapState() {
    // Set up a listener on the trap state
    var stateChar = stateCharacteristic();
    var stateReq = stateReqCharacteristic();

    stateChar.setNotifyValue(true);
    stateChar.onValueReceived.listen((v) {
      //if (v.isNotEmpty) {
        TrapState state = StateMessage.fromProto(v).toTrapState();
        logger.d(
            "Trap state received ${state.activeFlow} ${state.storageMounted}");
        trapStateSubject.add(state);
      //}
    });
    logger.d("Reading trap state");
    stateReq.write([0]);
  }


  void subscribeSessions() {
    sessionListEntryCharacteristic().setNotifyValue(true);
    sessionSubscribe =
        sessionListEntryCharacteristic().onValueReceived.listen((value) {
          logger.d("Session value received");
          var msg = SessionMessage.fromProto(value);
          if (msg.newSession != null) {
            newSessionStream.sink.add(msg.newSession!);
          } else if (msg.deleteSession != null) {
            deleteSessionStream.sink.add(msg.deleteSession!);
          } else if (msg.detailsMessage != null) {
            sessionDetailsStream.sink.add(msg.detailsMessage!);
          }
        });
    device?.cancelWhenDisconnected(sessionSubscribe as StreamSubscription);
    sessionListReqCharacteristic().write([0]);
  }

  void unsubscribeSessions() => sessionSubscribe?.cancel();

  void subscribeDetections(String session) {
    logger.d("Subscribe to detections on session $session");
    detectionNotifCharacteristic().setNotifyValue(true);
    final subscribe = detectionNotifCharacteristic().onValueReceived.listen((
        value) {
      logger.d("Detection value received");
      var meta = DetectionMetadataMessage.fromProto(value);
      if (meta.session == session) {
        detectionsStream.sink.add(meta);
      }
    });
    device?.cancelWhenDisconnected(subscribe);
    var req = DetectionsForSessionMessage(session).toProto();
    detectionsListReqCharacteristic().write(req.toList());
  }

  Future<ImageDesc> fetchImage(DetectionMetadata meta) {
    return imageManager.requestImage(meta);
  }
}
