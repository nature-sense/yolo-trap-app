import 'package:flutter/material.dart' hide ImageCache;
import 'package:watch_it/watch_it.dart';

import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';
import 'package:yolo_trap_app/image/image_cache.dart';
import 'dart:typed_data';


class InsectCard extends StatefulWidget {
  final DetectionMetadata meta;

  const InsectCard(this.meta, {super.key});

  @override
  State<StatefulWidget> createState() => _InsectCardState();
}

class _InsectCardState extends State<InsectCard> {

  Uint8List? img;

  @override
  void initState() {
    di<ImageCache>().getImage(widget.meta).then( (i) => setState(() => img = i));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: 80, //metadata.width.toDouble(),
          height:80,
          child : img == null ? Container(decoration: BoxDecoration(
              border: Border.all(color: Colors.white)
          ),) :
          Container(decoration: BoxDecoration(
              border: Border.all(color: Colors.white)
          ),child: FittedBox(fit: BoxFit.contain,child: Image.memory(img!, scale: 2.0, filterQuality: FilterQuality.medium)))
      )
      );
  }

}