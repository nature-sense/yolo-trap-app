import 'dart:typed_data';

import 'package:flutter/material.dart' hide ImageCache;
import 'package:intl/intl.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/detection_metadata.dart';
import 'package:yolo_trap_app/caches/image_cache.dart';

import '../detection_viewer_screen/detection_viewer_screen.dart';

class InsectRow extends StatefulWidget {
  final DetectionMetadata metadata;
  const InsectRow(this.metadata, {super.key});

  @override
  State<StatefulWidget> createState() => _InsectRowState();
}

class _InsectRowState extends State<InsectRow> {

  late DetectionMetadata metadata;
  late DateTime ts = DateTime.fromMillisecondsSinceEpoch(metadata.updated);
  late String formatted;
  bool imageLoaded = false;
  Uint8List? img;

  DateFormat dateFormat = DateFormat("HH:mm:ss");

  @override
  void initState() {
    metadata = widget.metadata;
    ts = DateTime.fromMillisecondsSinceEpoch(metadata.updated);
    formatted = dateFormat.format(ts);
    di<ImageCache>().getImage(metadata).then( (i) {
      setState(() {
        img = i;
        imageLoaded = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 5, 20, 5),
      child: imageLoaded ?
      InkWell( child : Row(
          children: [
            SizedBox(
                width: 80, //metadata.width.toDouble(),
                height:80,
                child : img == null ? Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),) :
                Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),child: FittedBox(fit: BoxFit.contain,child: Image.memory(img!, scale: 2.0, filterQuality: FilterQuality.medium)))
            ),
            SizedBox(width: 40),
            Column(children: [
              Text("Score : ${metadata.score.toStringAsFixed(2)}", style: Theme.of(context).textTheme.titleMedium),
              Text(formatted, style: Theme.of(context).textTheme.titleSmall),
              Text("${metadata.width}px x ${metadata.height}px", style: Theme.of(context).textTheme.titleSmall)

            ]),
            Spacer(),

            Padding(
              padding :EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Icon(Icons.arrow_forward_ios_sharp, size: 20.0,),
            ),

          ]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    DetectionViewerScreen(metadata,
                        key: Key("${metadata.session}/${metadata.detection}")),
                ));
          }) :
      Row(
          children: [
            SizedBox(
                width: 80, //metadata.width.toDouble(),
                height:80,
                child : img == null ? Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),) :
                Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),child: SizedBox(width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2.0)
                ))
            ),
            SizedBox(width: 40),
            Column(children: [
              Text("Score : ${metadata.score.toStringAsFixed(2)}", style: Theme.of(context).textTheme.titleMedium),
              Text(formatted, style: Theme.of(context).textTheme.titleSmall),
              Text("${metadata.width}px x ${metadata.height}px", style: Theme.of(context).textTheme.titleSmall)

            ]),
            Spacer(),
          ]),


    );
  }


}