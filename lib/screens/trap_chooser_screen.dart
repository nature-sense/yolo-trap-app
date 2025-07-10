import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

// =============================================================================
// Scanning Indicator
// Autonomous scanning indicator widget. Listens to the scanStateStream and
// displays a progress indicator when active
// =============================================================================
class ScanningIndicator extends StatefulWidget {
  const ScanningIndicator({super.key});

  @override
  State<StatefulWidget> createState() => _ScanningIndicatorState();
}

class _ScanningIndicatorState extends State<ScanningIndicator> with TickerProviderStateMixin {
  bool active = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(width: 20, height: 20,
          child: CircularProgressIndicator(strokeWidth: 2.0, value: controller.value,
          )
        )
    );
  }
}

class TrapChooserScreen extends StatefulWidget {
  final BluetoothManager bm;
  const TrapChooserScreen(this.bm, {super.key});

  @override
  State<TrapChooserScreen> createState() => _TrapChooserScreenState();
}

class _TrapChooserScreenState extends State<TrapChooserScreen> {

  List<String> devices = [];
  var logger = Logger();

  @override
  void initState() {
    logger.d("Trap chooser screen");
    widget.bm.scanStream.stream.listen((e) {
      if(mounted) {
        setState(() {
          if (!devices.contains(e.deviceName)) {
            devices.add(e.deviceName);
          }
        });
      }
    });
    widget.bm.startScanning();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Traps"),
          //actions: [ScanningIndicator()]
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

                 title: Text(devices[index]),
                 trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20.0,),
               ),
              onTap: () {
                widget.bm.stopScanning();
                widget.bm.connect(devices[index]);
              })
            )
        ),
      ));
  }
}