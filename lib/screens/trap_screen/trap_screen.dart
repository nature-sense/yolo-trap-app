import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';

import 'package:yolo_trap_app/screens/trap_screen/preview_panel.dart';
import 'package:yolo_trap_app/screens/trap_screen/trap_state_panel.dart';
import 'package:yolo_trap_app/screens/trap_screen/sessions_list_panel.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

import '../settings_screen/settings_screen.dart';

class TrapScreen extends StatelessWidget {
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child :Icon(Icons.close),
              onTap: () => di<BluetoothManager>().disconnect()
            ),
        actions: [
          InkWell(
              child : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Icon(Icons.settings_sharp),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen())
              )),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(di<BluetoothManager>().connectedDevice!),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            PreviewPanel(),
            TrapStatePanel(),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text("Sessions", style: Theme.of(context).textTheme.titleLarge),
                ),
                Spacer(),
              ],
            ),
            Expanded(child: SessionsListPanel()),
          ],
        ),
      ),
    );
  }
}
