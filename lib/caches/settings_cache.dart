import 'dart:async';

import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';
import 'package:yolo_trap_app/bluetooth/messages.dart';

class SettingsCache {
  SettingsMessage? settings;
  Completer<SettingsMessage>? completer;

  Future<SettingsMessage> getSettings() async {
    if (settings != null) {
      return settings!;
    } else {
      di<BluetoothManager>().getSettings();
      completer = Completer();
      return completer!.future;
    }
  }

  void updateSettings(SettingsMessage msg) {
    settings = msg;
    if (completer != null) {
      return completer!.complete(msg);
    }
  }

  void changeSettings(SettingsMessage msg) {
    settings = msg;
    di<BluetoothManager>().setSettings(settings!.toProto());
  }
}