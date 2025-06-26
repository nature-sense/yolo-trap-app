import 'package:flutter/material.dart' hide ConnectionState;
import 'package:logger/logger.dart';
import 'package:yolo_trap_app/screens/trap_chooser_screen.dart';
import 'package:yolo_trap_app/screens/trap_connecting_stream.dart';
import 'package:yolo_trap_app/screens/trap_screen/trap_screen.dart';
import '../bluetooth/bluetooth_connection.dart';

class ConnectedScreen extends StatefulWidget {
  final BluetoothConnection connection;
  ConnectedScreen(this.connection, {super.key});

  @override
  State<StatefulWidget> createState() => _ConnectedScreenState();
}

class _ConnectedScreenState extends State<ConnectedScreen> {
  var logger = Logger();
  ConnectionState state = ConnectionState.offline;

  @override
  void initState() {
    widget.connection.connectionSubject.stream.listen((s) {
      logger.d("Connected state = $s");
        setState(() => state = s);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return switch(state) {
      ConnectionState.offline => TrapChooserScreen(widget.connection),
      ConnectionState.connecting => TrapConnectingScreen(widget.connection),
      ConnectionState.connected => TrapScreen(widget.connection),
    };
  }
}