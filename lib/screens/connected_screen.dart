import 'package:flutter/material.dart' hide ConnectionState;
import 'package:logger/logger.dart';

import 'package:yolo_trap_app/screens/trap_chooser_screen.dart';
import 'package:yolo_trap_app/screens/trap_connecting_screen.dart';
import 'package:yolo_trap_app/screens/trap_screen/trap_screen.dart';
import 'package:yolo_trap_app/src/interface.g.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';


class ConnectedScreen extends StatefulWidget {
  final BluetoothManager bm;
  const ConnectedScreen(this.bm, {super.key});

  @override
  State<StatefulWidget> createState() => _ConnectedScreenState();
}

class _ConnectedScreenState extends State<ConnectedScreen> {
  var logger = Logger();
  ConnectionState state = ConnectionState.disconnected;

  @override
  void initState() {
    widget.bm.connectionStream.stream.listen((s) {
        setState(() => state = s);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return switch(state) {
      ConnectionState.disconnected => TrapChooserScreen(widget.bm, key: UniqueKey()),
      ConnectionState.connecting => TrapConnectingScreen(widget.bm),
      ConnectionState.connected => TrapScreen(widget.bm),
    };
  }
}