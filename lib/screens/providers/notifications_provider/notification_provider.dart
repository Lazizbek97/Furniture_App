import 'package:flutter/foundation.dart';

class NotificationProvider extends ChangeNotifier {
  bool sales = false;
  bool new_arrivals = false;
  bool delivery_status = false;

  changeSales() {
    sales = !sales;
    notifyListeners();
  }

  changeNewArrivals() {
    new_arrivals = !new_arrivals;
    notifyListeners();
  }

  cahngeDeliveryStatus() {
    delivery_status = !delivery_status;
    notifyListeners();
  }
}
