import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_connection.dart';
import 'package:yolo_trap_app/screens/trap_screen/preview_panel.dart';
import 'package:yolo_trap_app/screens/trap_screen/trap_state_panel.dart';
import 'package:yolo_trap_app/screens/trap_screen/sessions_list_panel.dart';

class TrapScreen extends StatefulWidget {
  final BluetoothConnection blueToothConnection;

  const TrapScreen(this.blueToothConnection, {super.key});

  @override
  State<StatefulWidget> createState() => _TrapScreenState();
}

class _TrapScreenState extends State<TrapScreen> {
  var logger = Logger();
  late BluetoothConnection connection;

  bool connected = false;
  bool? trapState;

  @override
  void initState() {
    connection = widget.blueToothConnection;
    connection.subscribeTrapState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child :Icon(Icons.close),
              onTap: () => connection.disconnect()
            ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(connection.device!.advName),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            PreviewPanel(connection),
            TrapStatePanel(connection),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text("Sessions", style: Theme.of(context).textTheme.titleLarge),
                ),
                Spacer(),
              ],
            ),
            Expanded(child: SessionsListPanel(connection)),
          ],
        ),
      ),
    );
  }
}
