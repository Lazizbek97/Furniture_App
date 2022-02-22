import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int menuIndex = 0;

  void changeMenu(int i) {
    menuIndex = i;
    notifyListeners();
  }
}
