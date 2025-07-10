import 'dart:typed_data' as td;

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';

import '../../bluetooth/bluetooth_manager.dart';
import 'insect_card.dart';

class DetectionsOverviewScreen extends StatefulWidget {
  final BluetoothManager bm;
  final String session;

  const DetectionsOverviewScreen(this.bm, this.session, { super.key });

  @override
  State<StatefulWidget> createState() => _DetectionsOverviewScreenState();
}

class _DetectionsOverviewScreenState extends State<DetectionsOverviewScreen> {
  var logger = Logger();
  late String session;
  late Stream<DetectionMetadata> detectionsStream;
  Map<int, DetectionMetadata> detections = {};

  @override
  void initState() {
    session = widget.session;
    widget.bm.detectionStream.listen((d) {
      logger.d("Received detection metadata");
      if (mounted) {
        setState(() {
          detections[d.detection] = d;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount =
        MediaQuery.of(context).size.width > 600
            ? 10 // For tablets and web
            : 4; // For mobile
    return Scaffold(
      appBar: AppBar(
        //leading: BackButton(onPressed: () => connection.disconnect()),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(session),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: 100, // Set fixed height for each item
              ),
              itemCount: detections.length,
              itemBuilder: (context, index) {
                return InsectCard(
                  widget.bm,
                  detections.values.elementAt(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
