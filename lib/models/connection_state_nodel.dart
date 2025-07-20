import 'package:flutter/material.dart' hide ConnectionState;
import 'package:yolo_trap_app/src/interface.g.dart';

class ConnectionStateModel extends ChangeNotifier {
  ConnectionState _state = ConnectionState.disconnected;
  get state => _state;

  void setState(ConnectionState state) {
    _state = state;
    notifyListeners();
  }
}
