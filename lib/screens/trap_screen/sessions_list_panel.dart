import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../bluetooth/bluetooth_manager.dart';
import '../../models/sessions_model.dart';
import '../detections_screen/detections_list_screen.dart';

class SessionsListPanel extends StatefulWidget {
  const SessionsListPanel({super.key});

  @override
  State<StatefulWidget> createState() => _SessionsListPanelState();
}

class _SessionsListPanelState extends State<SessionsListPanel> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  SessionsModel sessionModel = di<SessionsModel>();

  @override
  void initState() {
    sessionModel.clear();
    sessionModel.subscribe(
            (session) => _addItem(session),
            () => _updateItem(),
            (idx, session) => _removeItem(idx, session)
    );
    di<BluetoothManager>().publishSessionsList();
    super.initState();
  }

  void _addItem(Session newItem) {

    setState(() {});
    _listKey.currentState!.insertItem(0, duration: const Duration(milliseconds: 500));
  }

  void _updateItem() => setState(() {});

  void _removeItem(int index, Session session) {
    setState(() {});
    _listKey.currentState!.removeItem(
      index,
          (context, animation) => buildItem(session, animation),
    );
  }

  Widget buildItem(Session item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: InkWell(
        child: ListTile(
          leading: Icon(
            const IconData(0xe9a0, fontFamily: 'MaterialIcons'),
            color: Colors.blueAccent,),
          title: Text(item.sessionId),
          subtitle: Text("${item.detections} insects"),
          trailing: Icon(Icons.arrow_forward_ios_sharp)
      ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  DetectionsListScreen(item.sessionId, key: Key(item.sessionId)),
              ));
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: sessionModel.numSessions(),
        itemBuilder: (context, index, animation) {
          return buildItem(sessionModel.getSession(index), animation); // Build each list item
        },
    );
  }
}
