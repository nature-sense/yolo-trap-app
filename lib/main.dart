import 'package:flutter/material.dart' hide ImageCache;
import 'package:yolo_trap_app/image/image_cache.dart';
import 'package:yolo_trap_app/models/preview_frame_model.dart';
import 'package:yolo_trap_app/models/trap_state_model.dart';
import 'package:yolo_trap_app/screens/bluetooth/bluetooth_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:watch_it/watch_it.dart';

import 'bluetooth/bluetooth_manager.dart';
import 'globals.dart';
import 'models/bluetooth_state_model.dart';
import 'models/connection_state_nodel.dart';
import 'models/detections_model.dart';
import 'models/image_model.dart';
import 'models/scan_model.dart';
import 'models/sessions_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TrapApp());
}

class TrapApp extends StatelessWidget {
  TrapApp({super.key}) {
    di.registerSingleton<BluetoothManager>(BluetoothManager());
    di.registerSingleton<BluetoothStateModel>(BluetoothStateModel());
    di.registerSingleton<ConnectionStateModel>(ConnectionStateModel());
    di.registerSingleton<DetectionsModel>(DetectionsModel());
    di.registerSingleton<ImageModel>(ImageModel());
    di.registerSingleton<PreviewFrameModel>(PreviewFrameModel());
    di.registerSingleton<ScanModel>(ScanModel());
    di.registerSingleton<SessionsModel>(SessionsModel());
    di.registerSingleton<TrapStateModel>(TrapStateModel());
    di.registerSingleton<ImageCache>(ImageCache());
  }

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
      home: BluetoothScreen(),
    );
  }
}
