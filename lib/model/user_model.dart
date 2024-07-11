import 'package:flutter/cupertino.dart';

enum DrawerState { translates, maths, resizeToolImage, settings }

class UserModel extends ChangeNotifier {
  var _drawerStateValue = DrawerState.translates;

  get drawerStateValue => _drawerStateValue;

  void updateDrawerState(DrawerState drawerTab) {
    _drawerStateValue = drawerTab;
    notifyListeners();
  }
}
