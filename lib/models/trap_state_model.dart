import 'package:flutter/material.dart';

import '../bluetooth/messages.dart';

class TrapStateModel extends ChangeNotifier {
  ActiveFlow activeFlow = ActiveFlow.noFlow;

  void setState(ActiveFlow flow) {
    activeFlow = flow;
    notifyListeners();
  }
}