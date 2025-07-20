import 'package:flutter/material.dart';
import 'package:yolo_trap_app/src/interface.g.dart';

class BluetoothStateModel extends ChangeNotifier {
BluetoothState _state = BluetoothState.unknown;
get state => _state;

void setState(BluetoothState state) {
  _state = state;
  notifyListeners();
}
}
