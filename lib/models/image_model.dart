import 'package:flutter/material.dart';
import 'package:yolo_trap_app/bluetooth/messages.dart';

import '../bluetooth/detection_metadata.dart';


class ImageState {
  int numSegments = 0;
  int nextSegment = 1;
  int width = 0;
  int height = 0;
  List<int> image = [];
}

class ImageModel extends ChangeNotifier {
  /*
  void addSegment(ImageSegmentMessage hdr) {

    // listen on the image segment characteristic
      //logger.d("Received image segment");
      var key = sessionDetectToKey(hdr.session, hdr.detection);
      ImageState? ctx = imageStates[key];
      if (ctx != null) {
        ctx.width = hdr.width;
        ctx.height = hdr.height;
        ctx.numSegments = hdr.segments;
      } else {
        logger.w("Image header received for ${hdr.session}/${hdr
            .detection} but no context");
      }
    });


  }
*/


  /*Future<ImageDesc> requestImage(DetectionMetadata meta) {
    logger.d("Requesting img ${meta.session} ${meta.detection}");
    var key = metaToKey(meta);
    var completer = Completer<ImageDesc>();
    imageStates[key] = ImageContext(completer);
    bm.publishImageSegments(meta.session, meta.detection);
    return completer.future;
  }*/

String metaToKey(DetectionMetadata meta) => "${meta.session}/${meta.detection}";
String sessionDetectToKey(String session, int detection) => "$session/$detection";
}