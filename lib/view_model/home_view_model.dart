import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int curIndex = 0;

  //切换tabbar
  void tapTabbar(int index) {
    curIndex = index;
    notifyListeners();
  }
}
