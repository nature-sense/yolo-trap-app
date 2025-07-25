
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_manager.dart';

import 'package:yolo_trap_app/models/sessions_model.dart';
import 'package:yolo_trap_app/screens/detections_screen/detections_list_screen.dart';
import '../../models/trap_state_model.dart';

class SessionsListPanel extends WatchingWidget {
  final logger = Logger();

  SessionsListPanel({super.key});

  @override
  Widget build(BuildContext context) {

    final TrapStateModel stateModel = watchIt();
    switch(stateModel.storageMounted) {
      case MountedState.notMounted:
        return NoStorageError();
      case MountedState.mounted:
        return SessionList();
      case MountedState.unknown:
        return StorageUnknown();
    }
  }
}

class SessionList extends WatchingWidget {

  SessionList({super.key}) {
    di<BluetoothManager>().publishSessionsList();
  }

  @override
  Widget build(BuildContext context) {
  final SessionsModel sessionsModel = watchIt();
  List<Session> s = sessionsModel.sessions.values.toList();
  Iterable<Session> sessions = s.reversed;
    return ListView.builder(
        itemCount: sessions.length,
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
                leading: Icon(
                  const IconData(0xe9a0, fontFamily: 'MaterialIcons'),
                  color: Colors.blueAccent,),
                title: Text(sessions
                    .elementAt(index)
                    .sessionId),
                subtitle: Text("${sessions
                    .elementAt(index)
                    .detections} insects"),
                trailing: Icon(Icons.arrow_forward_ios_sharp)
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      DetectionsListScreen(sessions
                          .elementAt(index)
                          .sessionId,
                          key: Key(sessions
                              .elementAt(index)
                              .sessionId)),
                  ));
            },
          );
        });
  }
}

class NoStorageError extends StatelessWidget {
  const NoStorageError({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.warning_amber, color: Colors.red,),
              title: Text("Please insert a USB stick"),
          );
        });
  }
}

class StorageUnknown extends StatelessWidget {
  const StorageUnknown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( children : [
      Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20, height: 20,
              child: CircularProgressIndicator(strokeWidth: 2.0)
          )
        ],
      ),
      Spacer()
    ]);
  }
}