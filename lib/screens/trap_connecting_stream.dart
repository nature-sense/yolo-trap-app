import 'package:flutter/material.dart';

import '../bluetooth/bluetooth_connection.dart';

class TrapConnectingScreen extends StatelessWidget {
  final BluetoothConnection connection;

  const TrapConnectingScreen(this.connection, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(connection.device!.advName),
        ),
        body: Column( children : [
          Spacer(),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20, height: 20,
                  child: CircularProgressIndicator(strokeWidth: 3.0)
              )
            ],
          ),
          Spacer()
        ])
    );
  }
}