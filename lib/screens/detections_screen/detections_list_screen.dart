import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';

import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';
import 'package:yolo_trap_app/models/detections_model.dart';
import 'package:yolo_trap_app/screens/detections_screen/insect_row.dart';

class DetectionsListScreen extends WatchingWidget {
  final logger = Logger();
  final String session;

  DetectionsListScreen(this.session, {super.key}) {
    di<BluetoothManager>().publishDetections(session);
  }

  @override
  Widget build(BuildContext context) {
    final DetectionsModel detectionsModel = watchIt();
    var detections = detectionsModel.detections;

    return Scaffold(
      appBar: AppBar(
        //leading: BackButton(onPressed: () => connection.disconnect()),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(session),
      ),
      body:
      Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child : ListView(children: insects(detections, context)),
      )
    );
  }

  List<Widget> insects(List<DetectionMetadata> detections, BuildContext context) {
    List<Widget> list = [];
    for (var m in detections) {
      list.add(InsectRow(m));
    }
    return list;
  }
}
