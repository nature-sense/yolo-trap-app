import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'package:yolo_trap_app/screens/connected_screen.dart';
import 'package:yolo_trap_app/src/interface.g.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

class BluetoothScreen extends StatefulWidget {
  final BluetoothManager bm;
  BluetoothScreen(this.bm, {super.key}) {
    var x = 1;
  }

  @override
  State<StatefulWidget> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  var logger = Logger();
  bool active = false;

  @override
  void initState() {
    widget.bm.getBluetoothState();
    widget.bm.bluetoothStateStream.listen((e) =>
      setState(() => active = e == BluetoothState.online));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return active ? ConnectedScreen(widget.bm) : Container();
  }
}