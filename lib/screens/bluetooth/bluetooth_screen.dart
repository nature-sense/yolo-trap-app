import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/models/bluetooth_state_model.dart';
import 'package:yolo_trap_app/screens/bluetooth/bluetooth_error_screen.dart';
import 'package:yolo_trap_app/screens/connection/connected_screen.dart';
import 'package:yolo_trap_app/src/interface.g.dart';
import 'bluetooth_unknown_screen.dart';

class BluetoothScreen extends WatchingWidget {
  final logger = Logger();

  BluetoothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = watchPropertyValue((BluetoothStateModel m) => m.state);
    switch(state) {
      case BluetoothState.offline :
        return BluetoothErrorScreen();
      case BluetoothState.online:
        return ConnectedScreen();
      case BluetoothState.notSupported:
        return BluetoothErrorScreen();
      default:
        return BluetoothUnknownScreen();
    }
  }
}