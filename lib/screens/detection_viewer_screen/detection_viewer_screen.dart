import 'dart:typed_data';

import 'package:flutter/material.dart' hide ImageCache;
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';
import 'package:yolo_trap_app/caches/image_cache.dart';

class DetectionViewerScreen extends StatefulWidget {

  final DetectionMetadata metadata;

  const DetectionViewerScreen(this.metadata, {super.key});

  @override
  State<StatefulWidget> createState() => _DetectionViewerScreenState();
}

class _DetectionViewerScreenState extends State<DetectionViewerScreen> {
  late String session;
  late int detection;

  Uint8List? img;


  @override
  void initState() {
    di<ImageCache>().getImage(widget.metadata).then( (i) => setState(() => img = i));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        //leading: BackButton(onPressed: () => connection.disconnect()),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("${widget.metadata.session} / ${widget.metadata.detection}" ),
    ),
    body: Column(children: [
      Spacer(),
      Row(children : [
          Spacer(),
          SizedBox(
            width: widget.metadata.width.toDouble(),
            height:widget.metadata.height.toDouble(),
            child : showImage(),
          ),
          Spacer()
      ]),
      Spacer()
    ]));
  }

  Widget showImage() {
    if (img == null) {
      return Container(decoration: BoxDecoration(border: Border.all(color: Colors.white)));
    } else {
      return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: FittedBox(fit: BoxFit.contain,child: Image.memory(img!, filterQuality: FilterQuality.high))
      );
    }
  }
}