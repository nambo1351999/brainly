import 'package:flutter/material.dart';

enum TabTranslateState { doubleTranslate, singleTranslate, listTranslate }

class TranslateModel with ChangeNotifier {
  var _tableTranslate = TabTranslateState.doubleTranslate;

  get tableTranslate => _tableTranslate;

  void updateStateTabTranslate(TabTranslateState tab) {
    _tableTranslate = tab;
    notifyListeners();
  }
}
