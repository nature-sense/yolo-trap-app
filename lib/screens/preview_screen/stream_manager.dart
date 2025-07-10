import 'dart:async';

import 'package:logger/logger.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

class StreamState {
  int timestamp;
  int nextSegment;
  int numSegments;
  List<int> image = [];

  StreamState(this.timestamp, this.nextSegment, this.numSegments);
}

class ImageReference {
  int timestamp;
  List<int> image;

  ImageReference(this.timestamp, this.image);
}

class StreamManager {
  final BluetoothManager bm;
  StreamState? streamState;
  StreamController<List<int>> imageStream = StreamController();
  final logger = Logger();

  StreamManager(this.bm);

  void start() {
    logger.d("Stream manager starting");
    bm.previewHeaderStream.stream.listen(
      (hdr) => streamState = StreamState(hdr.timestamp, 1, hdr.segments),
    );

    bm.previewSegmentStream.stream.listen((seg) {
      if (streamState != null) {
        if (seg.timestamp != streamState!.timestamp) {
          streamState = null; // reset
          logger.d(
            "Timestamp mismatch ${seg.timestamp} ${streamState!.timestamp}",
          );
        } else if (seg.segment != streamState!.nextSegment) {
          streamState = null; // reset
          logger.d(
            "segment mismatch ${seg.segment} ${streamState!.nextSegment}",
          );
        } else {
          logger.d("Add segment ${seg.segment} of ${streamState!.numSegments}");
          streamState!.image.addAll(seg.data);
          if (seg.segment == streamState!.numSegments) {
            logger.d("Image complete");
            imageStream.sink.add(streamState!.image);
            streamState = null; // reset
          } else {
            ++streamState!.nextSegment;
          }
        }
      }
    });
  }
}
