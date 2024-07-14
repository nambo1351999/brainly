import 'package:flutter/cupertino.dart';

enum TabMathState { camera, draw, keyboard }

class MathModel extends ChangeNotifier {
  var _tableMath = TabMathState.camera;

  get tableMath => _tableMath;

  void updateStateTabMath(TabMathState tab) {
    _tableMath = tab;
    notifyListeners();
  }
}
