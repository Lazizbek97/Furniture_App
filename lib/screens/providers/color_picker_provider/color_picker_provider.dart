import 'package:flutter/foundation.dart';

class ColorPicker extends ChangeNotifier {
  int colorIndex = 0;

  changeColor(int index) {
    colorIndex = index;
    notifyListeners();
  }
}
