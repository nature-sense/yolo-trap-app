import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';
import 'package:yolo_trap_app/bluetooth/messages.dart';

import '../../models/preview_frame_model.dart';

class PreviewScreen extends WatchingWidget {
  PreviewScreen({super.key}) {
    di<BluetoothManager>().setFlow(ActiveFlow.previewFlow);
  }

  @override
  Widget build(BuildContext context) {
    final frame = watchPropertyValue((PreviewFrameModel m) => m.frame);

    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              child :Icon(Icons.close),
              onTap: () {
                di<BluetoothManager>().setFlow(ActiveFlow.noFlow);
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
            frame == null ?
            SizedBox(width: 20, height: 20,
                child: CircularProgressIndicator(strokeWidth: 3.0)
            ) :
                Flexible(child:
                  Image.memory(frame, gaplessPlayback: true,)
                ),
        ]),
      Spacer()
    ]));
  }
}