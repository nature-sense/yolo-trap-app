import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';

import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';
import 'package:yolo_trap_app/models/detections_model.dart';

import 'insect_card.dart';

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
      body: ListView(children: insects(detections, context)),
    );
  }

  List<Widget> insects(List<DetectionMetadata> detections, BuildContext context) {
    List<Widget> list = [];
    for (var m in detections) {
      list.add(insectRow(m, context));
    }
    return list;
  }

  Widget insectRow(DetectionMetadata metadata, BuildContext context) {
    DateTime ts = DateTime.fromMillisecondsSinceEpoch(metadata.updated);
    DateFormat dateFormat = DateFormat("HH:mm:ss");
    String formatted = dateFormat.format(ts);

    return Padding(
      padding: EdgeInsets.fromLTRB(40, 5, 20, 5),
      child: Row(
        children: [
          InsectCard(metadata),
          SizedBox(width: 40),
          Column(children: [
            Text("Score : ${metadata.score.toStringAsFixed(2)}", style: Theme.of(context).textTheme.titleLarge),
            Text(formatted, style: Theme.of(context).textTheme.titleMedium),

          ]),
          Spacer(),
        ],
      ),
    );
  }
}
