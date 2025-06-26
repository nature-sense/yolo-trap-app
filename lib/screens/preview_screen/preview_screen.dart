import 'package:flutter/material.dart';
import 'package:yolo_trap_app/screens/preview_screen/stream_manager.dart';
import 'dart:typed_data';

import 'package:yolo_trap_app/bluetooth/bluetooth_connection.dart';

import '../../bluetooth/messages.dart';

class PreviewScreen extends StatefulWidget {
  final BluetoothConnection connection;

  const PreviewScreen(this.connection, {super.key});

  @override
  State<StatefulWidget> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  
  late StreamManager streamManager;
  late BluetoothConnection connection;

  List<int> image = [];
  
  @override
  void initState() {
    connection = widget.connection;
    streamManager = StreamManager(connection);
    streamManager.start();
    streamManager.imageStream.stream.listen((data) {
      if(mounted) {
        setState(() => image = data);
      }
    });
    connection.setFlow(ActiveFlow.previewFlow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              child :Icon(Icons.close),
              onTap: () {
                connection.setFlow(ActiveFlow.noFlow);
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