import 'package:flutter/material.dart';
import 'package:yolo_trap_app/screens/bluetooth_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'bluetooth/bluetooth_manager.dart';
import 'globals.dart';

void main() {
  runApp(const TrapApp());
}

class TrapApp extends StatelessWidget {
  const TrapApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yolo Trap',
      scaffoldMessengerKey: snackbarKey,
      theme: FlexThemeData.light(scheme: FlexScheme.shadGreen),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.shadGreen),
      themeMode: ThemeMode.system,
      home: BluetoothScreen(BluetoothManager()),
    );
  }
}
