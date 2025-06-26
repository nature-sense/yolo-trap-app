import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:yolo_trap_app/bluetooth/bluetooth_connection.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';

import '../../bluetooth/image_manager.dart';

class InsectCard extends StatefulWidget {
  final BluetoothConnection blueToothConnection;
  final DetectionMetadata metadata;
  const InsectCard(this.blueToothConnection, this.metadata, {super.key});

  @override
  State<StatefulWidget> createState() => _InsectCardState();
}

class _InsectCardState extends State<InsectCard> {

  late BluetoothConnection connection;
  late DetectionMetadata metadata;
  ImageDesc? imageDescr;

  @override
  void initState() {
    connection = widget.blueToothConnection;
    metadata = widget.metadata;
    fetchImage();
    super.initState();
  }

  void fetchImage() async {
    var img = await Future.wait([connection.fetchImage(metadata)]);
    setState(() {
      imageDescr = img[0];
    });
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