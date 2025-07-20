import 'package:flutter/material.dart' hide ConnectionState;
import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';

import 'package:yolo_trap_app/screens/connection/trap_chooser_screen.dart';
import 'package:yolo_trap_app/screens/connection/trap_connecting_screen.dart';
import 'package:yolo_trap_app/screens/trap_screen/trap_screen.dart';
import 'package:yolo_trap_app/src/interface.g.dart';
import 'package:yolo_trap_app/models/connection_state_nodel.dart';

class ConnectedScreen extends WatchingWidget {
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    final state = watchPropertyValue((ConnectionStateModel m) => m.state);

    switch(state) {
      case ConnectionState.disconnected :
        return TrapChooserScreen();
      case ConnectionState.connecting :
        return TrapConnectingScreen();
      default:
        return TrapScreen();
    };
  }
}