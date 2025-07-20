import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ScanModel extends ChangeNotifier {
  final List<String> _peripherals = [];
  final logger = Logger();

  get peripherals => _peripherals;

  void addPeripheral(String peripheral) {
    if (!_peripherals.contains(peripheral)) {
      _peripherals.add(peripheral);
      notifyListeners();
    }
  }

  void clear() {
    _peripherals.clear();
    notifyListeners();
  }
}