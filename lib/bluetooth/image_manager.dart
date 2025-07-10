
import 'dart:async';

import 'package:logger/logger.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';
import 'bluetooth_manager.dart';

class ImageContext {
  Completer<ImageDesc> completer;
  int numSegments = 0;
  int width = 0;
  int height = 0;
  List<int> image = [];

  ImageContext(this.completer);
}


class ImageDesc {
  final int width;
  final int height;
  final List<int> img;

  ImageDesc(this.width, this.height, this.img);
}

class ImageRequest {
  final String session;
  final int detection;
  final StreamController<ImageDesc> replyStream;
  const ImageRequest(this.session, this.detection, this.replyStream);
}


class ImageManager {
  final BluetoothManager bm;
  ImageManager(this.bm);
  var logger = Logger();

  Map<String, ImageContext> imageStates = {};

  Future<ImageDesc> requestImage(DetectionMetadata meta) {
    logger.d("Requesting img ${meta.session} ${meta.detection}");
    var key = metaToKey(meta);
    var completer = Completer<ImageDesc>();
    imageStates[key] = ImageContext(completer);
    bm.publishImageSegments(meta.session, meta.detection);
    return completer.future;
  }

  String metaToKey(DetectionMetadata meta) => "${meta.session}/${meta.detection}";
  String sessionDetectToKey(String session, int detection) => "$session/$detection";

  void run() {
    logger.d("Running Image Manager");

    // listen on the image segment characteristic
    bm.imageHeaderStream.stream.listen((hdr) {
      logger.d("Received image segment");
      var key = sessionDetectToKey(hdr.session, hdr.detection);
      ImageContext? ctx = imageStates[key];
      if (ctx != null) {
        ctx.width = hdr.width;
        ctx.height = hdr.height;
        ctx.numSegments = hdr.segments;
      } else {
        logger.w("Image header received for ${hdr.session}/${hdr
            .detection} but no context");
      }
    });
    bm.imageSegmentStream.stream.listen((seg) {
        var key = sessionDetectToKey(seg.session, seg.detection);
        ImageContext? ctx = imageStates[key];
        if(ctx != null) {
          ctx.image.addAll(seg.data);
          if(seg.segment == ctx.numSegments) {
            ImageDesc image = ImageDesc(ctx.width, ctx.height, ctx.image);
            var completer = ctx.completer;
            imageStates.remove(key);
            completer.complete(image);
          }
        } else {
          logger.w("Image segment received for ${seg.session}/${seg.detection} but no context" );
        }
      }
    );
  }
}