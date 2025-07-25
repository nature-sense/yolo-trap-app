import 'package:flutter/material.dart';

class Session {
  String sessionId;
  int detections;
  Session(this.sessionId, this.detections);

  //static Session fromMessage(SessionDetailsMessage msg) => Session(msg.session, msg.detections);
}


class SessionsModel extends ChangeNotifier {
  final Map<String, Session> _sessions = {};
  get sessions => _sessions;


  void newSession(Session session) {
    _sessions[session.sessionId] = session;
    notifyListeners();
  }

  void deleteSession(String sessionId) {
    _sessions.remove(sessionId);
    notifyListeners();
  }

  void updateSession(Session session) {
    _sessions[session.sessionId] = session;
    notifyListeners();
  }

  void clear() {
    _sessions.clear();
    notifyListeners();
  }
}
