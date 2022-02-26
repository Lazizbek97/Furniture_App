import 'package:flutter/foundation.dart';

class CheckOutProvider extends ChangeNotifier {
  double discount = 0;

  addDiscount(double summa) {
    discount = summa;
    notifyListeners();
  }
}
