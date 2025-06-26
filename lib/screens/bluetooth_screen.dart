import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:yolo_trap_app/screens/connected_screen.dart';

import '../bluetooth/bluetooth_connection.dart';

class BluetoothScreen extends StatefulWidget {
  final BluetoothConnection blueToothConnection;
  const BluetoothScreen(this.blueToothConnection, {super.key});

  @override
  State<StatefulWidget> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  var logger = Logger();
  bool active = false;

  @override
  void initState() {
    widget.blueToothConnection.bluetoothSubject.stream.listen((s) {
      logger.d("Bluetooth state = $s");
      setState(() => active = s );
    });
    widget.blueToothConnection.initBluetooth();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return active ? ConnectedScreen(widget.blueToothConnection) : Container();
  }
}