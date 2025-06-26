import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'package:yolo_trap_app/bluetooth/bluetooth_connection.dart';

// =============================================================================
// Scanning Indicator
// Autonomous scanning indicator widget. Listens to the scanStateStream and
// displays a progress indicator when active
// =============================================================================
class ScanningIndicator extends StatefulWidget {
  final BehaviorSubject<bool> scanStateSubject;
  const ScanningIndicator(this.scanStateSubject, {super.key});

  @override
  State<StatefulWidget> createState() => _ScanningIndicatorState();
}

class _ScanningIndicatorState extends State<ScanningIndicator> {
  bool active = false;

  @override
  void initState() {
    widget.scanStateSubject.stream.listen((state) {
      if(mounted) {
        setState(() => active = state);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(width: 20, height: 20,
          child: active ? CircularProgressIndicator(strokeWidth: 3.0) : Container()
        )
    );
  }
}

class TrapChooserScreen extends StatefulWidget {
  final BluetoothConnection connection;
  const TrapChooserScreen(this.connection,{super.key});

  @override
  State<TrapChooserScreen> createState() => _TrapChooserScreenState();
}

class _TrapChooserScreenState extends State<TrapChooserScreen> {

  List<ScanResult> devices = [];
  var logger = Logger();

  @override
  void initState() {
    logger.d("Trap chooser screen");
    widget.connection.scanResultsStream.listen((d) {
      if(mounted) {
        setState(() {
          if (!devices.contains(d)) {
            devices.add(d);
          }
        });
      }
    });
    widget.connection.scan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Traps"),
          actions: [ScanningIndicator(widget.connection.scanStateSubject)]
        ),
        body: Padding(
            padding : EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Center(
          child: ListView.builder(
            itemCount:devices.length,
            itemBuilder: (context, index) =>
            InkWell(child:
               ListTile(
                 leading: Icon(const IconData(0xef1f, fontFamily: 'MaterialIcons'),size: 32.0,),

                 title: Text(devices[index].device.advName),
                 trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20.0,),
               ),
              onTap: () => widget.connection.connect(devices[index].device),
                //Navigator.push(
                //  context,
                //  MaterialPageRoute(builder: (context) => TrapScreen(widget.connection)),
                //);
              //},
            )
        ),
      )));
  }
}