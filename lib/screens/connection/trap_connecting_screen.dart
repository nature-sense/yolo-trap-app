import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import '../../bluetooth/bluetooth_manager.dart';

class TrapConnectingScreen extends StatelessWidget {
  const TrapConnectingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(di<BluetoothManager>().connectedDevice!),
        ),
        body: Column( children : [
          Spacer(),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20, height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              )
            ],
          ),
          Spacer()
        ])
    );
  }
}