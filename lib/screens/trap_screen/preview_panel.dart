import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import 'package:yolo_trap_app/bluetooth/messages.dart';
import 'package:yolo_trap_app/models/trap_state_model.dart';
import 'package:yolo_trap_app/screens/preview_screen/preview_screen.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

import 'button_state.dart';

class PreviewPanel extends WatchingWidget {

  final ButtonStyle startStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 14), backgroundColor: Colors.green,
  );

  final ButtonStyle stopStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 14),  backgroundColor: Colors.red
  );

  final ButtonStyle disabledStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 14),  backgroundColor: Colors.white38
  );

  @override
  Widget build(BuildContext context) {
    final state = watchPropertyValue((TrapStateModel m) => m.activeFlow);

    ButtonState buttonState = ButtonState.buttonDisabled;
    if(state == ActiveFlow.noFlow) {
      buttonState = ButtonState.buttonStart;
    } else if(state == ActiveFlow.previewFlow) {
      buttonState = ButtonState.buttonStop;
    }

    return Row( children: [
      Padding(
          padding : EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Text("Preview", style: Theme.of(context).textTheme.titleMedium)
      ),
      Spacer(),
      Padding(
          padding : EdgeInsets.fromLTRB(0, 10, 20, 10),
          child:renderButton(buttonState, context)
      )
    ]);
  }

  Widget renderButton(ButtonState buttonState, BuildContext context) {
    switch(buttonState) {
      case ButtonState.buttonStart :
        return FilledButton(
            style: startStyle,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreviewScreen())
              );},
              child: const Text('Show')

        );
      case ButtonState.buttonStop :
        return FilledButton(
          style: stopStyle,
          onPressed: () => di<BluetoothManager>().setFlow(ActiveFlow.noFlow),
          child: const Text('Close'),
        );

      default:
      return FilledButton(
        style: disabledStyle,
        onPressed: () {},
        child: const Text('Show'),
      );
    }
  }
}