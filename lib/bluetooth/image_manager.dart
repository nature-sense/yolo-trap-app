
import 'dart:async';

import 'package:logger/logger.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth.pb.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';

import 'bluetooth_connection.dart';
import 'messages.dart';

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
  final BluetoothConnection connection;
  ImageManager(this.connection);
  var logger = Logger();

  Map<String, ImageContext> imageStates = {};

  Future<ImageDesc> requestImage(DetectionMetadata meta) {
    logger.d("Requesting img ${meta.session} ${meta.detection}");
    var key = metaToKey(meta);
    var completer = Completer<ImageDesc>();
    imageStates[key] = ImageContext(completer);
    var msg = DetectionReferenceMessage(meta.session, meta.detection).toProto();
    connection.imageReqCharacteristic().write(msg);
    return completer.future;
  }

  String metaToKey(DetectionMetadata meta) => "${meta.session}/${meta.detection}";
  String sessionDetectToKey(String session, int detection) => "$session/$detection";

  void run() {
    logger.d("Running Image Manager");

    // listen on the image segment characteristic
    connection.imageSegmentCharacteristic().setNotifyValue(true);
    final subscribe = connection
        .imageSegmentCharacteristic()
        .onValueReceived
        .listen((segment) {
      var msg = ImageMessage.fromProto(segment);
      logger.d("Received image segment");
      if (msg.header != null) {
        var key = sessionDetectToKey(msg.header!.session, msg.header!.detection);
        ImageContext? ctx = imageStates[key];
        if(ctx != null) {
          ctx.width = msg.header!.width;
          ctx.height = msg.header!.height;
          ctx.numSegments = msg.header!.segments;
        } else {
          logger.w("Image header received for ${msg.header!.session}/${msg.header!.detection} but no context" );
        }

      } else if(msg.segment != null) {
        var key = sessionDetectToKey(msg.segment!.session, msg.segment!.detection);
        ImageContext? ctx = imageStates[key];
        if(ctx != null) {
          ctx.image.addAll(msg.segment!.data);
          if(msg.segment!.segment == ctx.numSegments) {
            ImageDesc image = ImageDesc(ctx.width, ctx.height, ctx.image);
            var completer = ctx.completer;
            imageStates.remove(key);
            completer.complete(image);
          }
        } else {
          logger.w("Image segment received for ${msg.header!.session}/${msg.header!.detection} but no context" );
        }
      }
    });
    connection.device?.cancelWhenDisconnected(subscribe);
  }
}