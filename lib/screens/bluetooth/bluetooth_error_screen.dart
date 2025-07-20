import 'package:flutter/material.dart';

class BluetoothErrorScreen extends StatelessWidget {
  const BluetoothErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      //leading: BackButton(onPressed: () => connection.disconnect()),
      backgroundColor: Theme.of(context).colorScheme.error,
      title: Text("No bluetooth"),

    ));
  }
}