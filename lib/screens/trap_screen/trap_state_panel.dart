import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

import '../../bluetooth/bluetooth_manager.dart';
import '../../bluetooth/messages.dart';
import "button_state.dart";

class TrapStatePanel extends StatefulWidget {
  final BluetoothManager bm;
  const TrapStatePanel(this.bm, {super.key});

  @override
  State<StatefulWidget> createState() => _TrapStatePanelState();
}

class _TrapStatePanelState extends State<TrapStatePanel> {
  var logger = Logger();

  ButtonState buttonState = ButtonState.buttonDisabled;

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
  void initState() {
    widget.bm.stateNotifStream.listen((state) {
      logger.d("Trap state panel received state ${state.activeFlow} ${state.storageMounted}");
      if(mounted) {
        setState(() {
          if(!state.storageMounted) {
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
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row( children: [
      Padding(
          padding : EdgeInsets.fromLTRB(20, 10, 0, 20),
          child: Text("Capture", style: Theme.of(context).textTheme.titleMedium)
      ),
      Spacer(),
      Padding(
          padding : EdgeInsets.fromLTRB(0, 10, 20, 20),
          child:renderButton()
      )
    ]);
  }

  Widget renderButton() {
    switch(buttonState) {
      case ButtonState.buttonStart:
        return FilledButton(
            style: startStyle,
            onPressed: () => widget.bm.setFlow(ActiveFlow.detectFlow),
            child: const Text('Start')
        );
      case ButtonState.buttonStop:
        return FilledButton(
          style: stopStyle,
          onPressed: () => widget.bm.setFlow(ActiveFlow.noFlow),
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
