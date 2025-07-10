import 'package:flutter/material.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';
import 'dart:typed_data';

import 'package:yolo_trap_app/screens/preview_screen/stream_manager.dart';
import 'package:yolo_trap_app/bluetooth/messages.dart';

class PreviewScreen extends StatefulWidget {
  final BluetoothManager bm;

  const PreviewScreen(this.bm, {super.key});

  @override
  State<StatefulWidget> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  
  late StreamManager streamManager;

  List<int> image = [];
  
  @override
  void initState() {
    streamManager = StreamManager(widget.bm);
    streamManager.start();
    streamManager.imageStream.stream.listen((data) {
      if(mounted) {
        setState(() => image = data);
      }
    });
    widget.bm.setFlow(ActiveFlow.previewFlow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              child :Icon(Icons.close),
              onTap: () {
                widget.bm.setFlow(ActiveFlow.noFlow);
                Navigator.pop(context);
              },
          ),
          //leading: BackButton(onPressed: () => connection.disconnect()),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Preview"),
        ),
        body: Column(
        children: [
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            image.isEmpty ?
            SizedBox(width: 20, height: 20,
                child: CircularProgressIndicator(strokeWidth: 3.0)
            ) :
                Flexible(child:
              Image.memory(Uint8List.fromList(image), gaplessPlayback: true,)),
        ]),
      Spacer()
    ]));
  }
}