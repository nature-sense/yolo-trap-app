import 'package:flutter/material.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';

class DetectionsModel extends ChangeNotifier {
  final List<DetectionMetadata> _detections = [];
  get detections => _detections;

  void addDetection(DetectionMetadata detection) {
    _detections.add(detection);
    notifyListeners();
  }

  void clear() {
    _detections.clear();
    notifyListeners();
  }
}

