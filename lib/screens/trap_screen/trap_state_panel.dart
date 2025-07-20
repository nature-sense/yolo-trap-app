import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';
import 'package:watch_it/watch_it.dart';

import '../../bluetooth/bluetooth_manager.dart';
import '../../bluetooth/messages.dart';
import '../../models/trap_state_model.dart';
import "button_state.dart";

class TrapStatePanel extends WatchingWidget {
  final logger = Logger();


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
    final TrapStateModel state = watchIt();
    ButtonState buttonState = ButtonState.buttonDisabled;
    if(state.storageMounted == MountedState.unknown || state.storageMounted == MountedState.notMounted) {
      buttonState = ButtonState.buttonDisabled;
    } else {
      switch (state.activeFlow) {
        case ActiveFlow.noFlow :
          buttonState = ButtonState.buttonStart;
          break;
        case ActiveFlow.detectFlow :
          buttonState = ButtonState.buttonStop;
          break;
        default:
          buttonState = ButtonState.buttonDisabled;
      };
    }
    return Row( children: [
      Padding(
          padding : EdgeInsets.fromLTRB(20, 10, 0, 20),
          child: Text("Capture", style: Theme.of(context).textTheme.titleMedium)
      ),
      Spacer(),
      Padding(
          padding : EdgeInsets.fromLTRB(0, 10, 20, 20),
          child:renderButton(buttonState)
      )
    ]);
  }

  Widget renderButton(ButtonState buttonState) {
    switch(buttonState) {
      case ButtonState.buttonStart:
        return FilledButton(
            style: startStyle,
            onPressed: () => di<BluetoothManager>().setFlow(ActiveFlow.detectFlow),
            child: const Text('Start')
        );
      case ButtonState.buttonStop:
        return FilledButton(
          style: stopStyle,
          onPressed: () => di<BluetoothManager>().setFlow(ActiveFlow.noFlow),
          child: const Text('Stop'),
        );
      default:
        return FilledButton(
          style: disabledStyle,
          onPressed: () {},
          child: const Text('Start'),
        );
    }
  }
}
