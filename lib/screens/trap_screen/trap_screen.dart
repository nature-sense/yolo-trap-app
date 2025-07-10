import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:yolo_trap_app/screens/trap_screen/preview_panel.dart';
import 'package:yolo_trap_app/screens/trap_screen/trap_state_panel.dart';
import 'package:yolo_trap_app/screens/trap_screen/sessions_list_panel.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

class TrapScreen extends StatefulWidget {
  final BluetoothManager bm;

  const TrapScreen(this.bm, {super.key});

  @override
  State<StatefulWidget> createState() => _TrapScreenState();
}

class _TrapScreenState extends State<TrapScreen> {
  var logger = Logger();

  bool connected = false;
  bool? trapState;

  @override
  void initState() {
    widget.bm.publishFlow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child :Icon(Icons.close),
              onTap: () => widget.bm.disconnect()
            ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.bm.connectedDevice!),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            PreviewPanel(widget.bm),
            TrapStatePanel(widget.bm),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text("Sessions", style: Theme.of(context).textTheme.titleLarge),
                ),
                Spacer(),
              ],
            ),
            Expanded(child: SessionsListPanel(widget.bm)),
          ],
        ),
      ),
    );
  }
}
