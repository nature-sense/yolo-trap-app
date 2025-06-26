
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yolo_trap_app/bluetooth/bluetooth_connection.dart';
import 'package:yolo_trap_app/screens/detections_screen/detections_overview_screen.dart';

import '../../bluetooth/messages.dart';

class Session {
  String session;
  int detections;
  Session(this.session, this.detections);

  static Session fromMessage(SessionDetailsMessage msg) => Session(msg.session, msg.detections);
}


class SessionsListPanel extends StatefulWidget {
  final BluetoothConnection connection;

  const SessionsListPanel(this.connection,  {super.key});

  @override
  State<StatefulWidget> createState() => _SessionsListPanelState();
}

class _SessionsListPanelState extends State<SessionsListPanel> {
  var logger = Logger();

  late BluetoothConnection connection;
  StreamSubscription<NewSessionMessage>? newSessSubscr;
  StreamSubscription<DeleteSessionMessage>? delSessSubscr;
  StreamSubscription<SessionDetailsMessage>? sessDetailsSubscr;

  Map<String, Session> sessions = {};
  bool hasStorage = true;

  @override
  void initState() {
    super.initState();
    connection = widget.connection;

    connection.trapStateSubject.listen((state) {

      if(!state.storageMounted) {
        newSessSubscr?.cancel();
        delSessSubscr?.cancel();
        sessDetailsSubscr?.cancel();
        connection.unsubscribeSessions();
        setState(() {
          sessions.clear();
          hasStorage = false;
        });
      } else {
        hasStorage = true;
        newSessSubscr = connection.newSessionStream.listen((ns) {
          if(mounted) {
            logger.d("New session ${ns.session}");
            setState(() => sessions[ns.session] = Session(ns.session, 0));
          }
        });

        delSessSubscr = connection.deleteSessionStream.listen((ds) {
          if(mounted) {
            logger.d("Delete Session ${ds.session}");
            setState(() => sessions.remove(ds.session));
          }
        });

        sessDetailsSubscr = connection.sessionDetailsStream.listen((sd) {
          if(mounted) {
            logger.d("Session details ${sd.session}");
            setState(() => sessions[sd.session] = Session.fromMessage(sd));
          }
        });
        connection.subscribeSessions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(hasStorage) {
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
                  title: Text(sessions.values
                      .elementAt(index)
                      .session),
                  subtitle: Text("${sessions.values
                      .elementAt(index)
                      .detections} insects"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp)
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        DetectionsOverviewScreen(connection, sessions.values
                            .elementAt(index)
                            .session,
                            key: Key(sessions.values
                                .elementAt(index)
                                .session)),
                    ));
              },
            );
          });
    } else {
      return ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              child: ListTile(
                  leading: Icon(Icons.warning_amber, color: Colors.red,),
                  title: Text("Please insert a USB stick"),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        DetectionsOverviewScreen(connection, sessions.values
                            .elementAt(index)
                            .session,
                            key: Key(sessions.values
                                .elementAt(index)
                                .session)),
                    ));
              },
            );
          });
    }
  }




}
