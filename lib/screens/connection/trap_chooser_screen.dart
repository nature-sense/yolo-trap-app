import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';
import 'package:yolo_trap_app/models/scan_model.dart';

class TrapChooserScreen extends WatchingWidget {
  TrapChooserScreen({super.key}) {
    di<BluetoothManager>().startScanning();
  }

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    final ScanModel sm = watchIt();
    var devices = sm.peripherals;
    //final List<String> devices = watchIt((ScanModel m) => m.peripherals);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Traps"),
          //actions: [ScanningIndicator()]
        ),
        body: Padding(
            padding : EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Center(
          child: ListView.builder(
            itemCount:devices.length,
            itemBuilder: (context, index) =>
            InkWell(child:
               ListTile(
                 leading: Icon(const IconData(0xef1f, fontFamily: 'MaterialIcons'),size: 32.0,),
                 title: Text(devices[index]),
                 trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20.0,),
               ),
              onTap: () {
                di<BluetoothManager>().stopScanning();
                logger.d("Cancelling stream");
                di<BluetoothManager>().connect(devices[index]);
              })
            )
        ),
      ));
  }
}