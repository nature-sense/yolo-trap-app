import 'package:flutter/material.dart';

import '../bluetooth/messages.dart';

enum MountedState {
  notMounted,
  mounted,
  unknown
}

class TrapStateModel extends ChangeNotifier {
  ActiveFlow activeFlow = ActiveFlow.noFlow;
  MountedState storageMounted = MountedState.unknown;

  void setState(ActiveFlow flow, bool mounted) {
    activeFlow = flow;
    storageMounted = mounted ? MountedState.mounted : MountedState.notMounted;
    notifyListeners();
  }
}