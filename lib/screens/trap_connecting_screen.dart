import 'package:flutter/material.dart';
import '../bluetooth/bluetooth_manager.dart';

class TrapConnectingScreen extends StatelessWidget {
  final BluetoothManager bm;

  const TrapConnectingScreen(this.bm, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("") //connection.device!.advName),
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