import 'dart:async';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';
import 'package:yolo_trap_app/bluetooth/messages.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';

class ImageContext {
  Completer<Uint8List> completer;
  int numSegments = 0;
  int nextSegment = 1;
  int width = 0;
  int height = 0;
  List<int> image = [];

  ImageContext(this.completer);
}

class ImageCache {
  final logger = Logger();

  Map<String, Uint8List> cache = {};
  Map<String, ImageContext> imageContexts = {};

  Future<Uint8List> getImage(DetectionMetadata meta) async {
    var completer = Completer<Uint8List>();
    var key = metaToKey(meta);
    var image = cache[key];
    if (image != null) {
      return image;
    } else {
      imageContexts[key] = ImageContext(completer);
      di<BluetoothManager>().publishImageSegments(meta.session, meta.detection);
      return completer.future;
    }
  }

  void addHeader(ImageHeaderMessage hdr) {
    //logger.d("Received image segment");
    var key = sessionDetectToKey(hdr.session, hdr.detection);
    ImageContext? ctx = imageContexts[key];
    if (ctx != null) {
      ctx.width = hdr.width;
      ctx.height = hdr.height;
      ctx.numSegments = hdr.segments;
    } else {
      logger.w(
        "Image header received for ${hdr.session}/${hdr.detection} but no context",
      );
    }
  }

  void addSegment(ImageSegmentMessage seg) {
    var key = sessionDetectToKey(seg.session, seg.detection);
    ImageContext? ctx = imageContexts[key];
    if (ctx != null) {
      if (seg.segment == ctx.nextSegment) {
        ctx.image.addAll(seg.data);
        ctx.nextSegment = ctx.nextSegment + 1;
        imageContexts[key] = ctx;
        if (seg.segment == ctx.numSegments) {
          var img = Uint8List.fromList(ctx.image);
          cache[key] = img;
          //logger.d("Image complete ${seg.session}, ${seg.detection}");
          ctx.completer.complete(img);
          imageContexts.remove(key);
        }
      } else {
        logger.w(
          "Image segment ${seg.segment} out of sequence - expecting ${ctx.nextSegment}",
        );
      }
    } else {
      logger.w(
        "Image segment received for ${seg.session}/${seg.detection} ${seg.segment} but no context",
      );
    }
  }

  String metaToKey(DetectionMetadata meta) =>
      "${meta.session}/${meta.detection}";

  String sessionDetectToKey(String session, int detection) =>
      "$session/$detection";
}
