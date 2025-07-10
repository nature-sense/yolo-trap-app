import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';
import 'package:yolo_trap_app/bluetooth/image_manager.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

class InsectCard extends StatefulWidget {
  final BluetoothManager bm;
  final DetectionMetadata metadata;
  const InsectCard(this.bm, this.metadata, {super.key});

  @override
  State<StatefulWidget> createState() => _InsectCardState();
}

class _InsectCardState extends State<InsectCard> {

  late DetectionMetadata metadata;
  late ImageManager imageManager = ImageManager(widget.bm);
  ImageDesc? imageDescr;

  @override
  void initState() {
    metadata = widget.metadata;
    imageManager = ImageManager(widget.bm);
    imageManager.run();
    fetchImage();
    super.initState();
  }

  void fetchImage() async {
    var img = await Future.wait([imageManager.requestImage(metadata)]);
    setState(() => imageDescr = img[0] );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: metadata.width.toDouble(),
          height: metadata.height.toDouble(),
          child: imageDescr == null ?
            Container(color: Colors.white38) :
              Image.memory(Uint8List.fromList(imageDescr!.img))
      )
    );
  }
}