import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../bluetooth/messages.dart';

class FrameState {
  int timestamp;
  int nextSegment;
  int numSegments;
  List<int> image = [];


  FrameState(this.timestamp, this.nextSegment, this.numSegments);
}

class PreviewFrameModel extends ChangeNotifier {
  var logger = Logger();
  FrameState? _frameState;
  Uint8List? _frame;

  get frame => _frame;

  void addHeader(FrameHeaderMessage hdr) {
    _frameState = FrameState(hdr.timestamp, 1, hdr.segments);
  }

  void addSegment(FrameSegmentMessage seg) {
    if (_frameState != null) {
      if (seg.timestamp != _frameState!.timestamp) {
        _frameState = null; // reset
        logger.d(
          "Timestamp mismatch ${seg.timestamp} ${_frameState!.timestamp}",);
      } else if (seg.segment != _frameState!.nextSegment) {
        _frameState = null; // reset
        logger.d("segment mismatch ${seg.segment}",);
      } else {
        logger.d("Add segment ${seg.segment} of ${_frameState!.numSegments}");
        _frameState!.image.addAll(seg.data);
        if (seg.segment == _frameState!.numSegments) {
          logger.d("Image complete");
          _frame = Uint8List.fromList(_frameState!.image);
          _frameState = null; // reset

          notifyListeners();
        } else {
          ++_frameState!.nextSegment;
        }
      }
    }
  }
}