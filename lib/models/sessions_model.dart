import 'dart:collection';

class Session {
  String sessionId;
  int detections;

  Session(this.sessionId, this.detections);
}

class SessionsModel {
  final Map<String, Session> _sessions = {};
  final List<String> _sessionIds = [];
  get sessions => _sessionIds;

  Function(Session)? newSessionFunc;
  Function()? updateSessionFunc;
  Function(int, Session)? deleteSessionFunc;

  void subscribe(Function(Session) ns, Function() us, Function(int, Session) ds) {
    newSessionFunc = ns;
    updateSessionFunc = us;
    deleteSessionFunc = ds;
  }

  void unsubscribe() {
    newSessionFunc = null;
    updateSessionFunc = null;
    deleteSessionFunc = null;
  }

  Session getSession(int index) => _sessions[_sessionIds[index]]!;
  int numSessions() => _sessionIds.length;

  void newSession(Session session) {
    _sessions[session.sessionId] = session;
    _sessionIds.insert(0, session.sessionId);

    if(newSessionFunc != null) {
      newSessionFunc!(session);
    }
  }

  void deleteSession(String sessionId) {
    var session = _sessions.remove(sessionId);
    int idx = _sessionIds.indexOf(sessionId);
    _sessionIds.removeAt(idx);
    if(newSessionFunc != null) {
      deleteSessionFunc!(idx, session!);
    }
  }

  void updateSession(Session session) {
    int idx = _sessionIds.indexOf(session.sessionId);
    if(idx == -1) {
      newSession(session);
    } else {
      _sessions[session.sessionId] = session;
      if (updateSessionFunc != null) {
        updateSessionFunc!();
      }
    }
  }

  void clear() {
    _sessions.clear();
    _sessionIds.clear();
    //notifyListeners();
  }
}
