import 'package:flutter/material.dart';

import 'package:yolo_trap_app/bluetooth/messages.dart';
import 'package:yolo_trap_app/screens/preview_screen/preview_screen.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

import 'button_state.dart';


class PreviewPanel extends StatefulWidget {
  final BluetoothManager bm;
  const PreviewPanel(this.bm, {super.key});

  @override
  State<StatefulWidget> createState() => _PreviewPanelState();
}

class _PreviewPanelState extends State<PreviewPanel> {

  TrapState? trapState;
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
      if(mounted) {
        setState(() {
          switch (state.activeFlow) {
            case ActiveFlow.noFlow :
              buttonState = ButtonState.buttonStart;
              break;
            case ActiveFlow.previewFlow :
              buttonState = ButtonState.buttonStop;
              break;
            default:
              buttonState = ButtonState.buttonDisabled;
          };
        });
        }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row( children: [
      Padding(
          padding : EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Text("Preview", style: Theme.of(context).textTheme.titleMedium)
      ),
      Spacer(),
      Padding(
          padding : EdgeInsets.fromLTRB(0, 10, 20, 10),
          child:renderButton()
      )
    ]);
  }

  Widget renderButton() {
    switch(buttonState) {
      case ButtonState.buttonStart :
        return FilledButton(
            style: startStyle,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreviewScreen(widget.bm))
              );},
              child: const Text('Show')

        );
      case ButtonState.buttonStop :
        return FilledButton(
          style: stopStyle,
          onPressed: () => widget.bm.setFlow(ActiveFlow.noFlow),
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