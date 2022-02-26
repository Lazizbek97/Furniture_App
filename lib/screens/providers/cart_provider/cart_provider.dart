import 'package:flutter/foundation.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:hive/hive.dart';

import '../../../core/models/furniture_model.dart';

class CartProvider extends ChangeNotifier {
  Box<Item> cartItems = Boxes.getCartItems();

  int modelCount = 1;
  double total = 0;

  totalSum({double discount = 0}) {
    total = 0;
    cartItems.values.toList().forEach((element) {
      total = total + (element.price! * element.count!);
    });
    total = double.parse((total - discount).toStringAsFixed(3));

    notifyListeners();
  }

  addCount(Item model) {
    model.count = model.count! + 1;

    modelCount = model.count!;
    notifyListeners();
  }

  removeCount(Item model) {
    if (model.count! > 1) {
      model.count = model.count! - 1;
    }
    modelCount = model.count!;

    notifyListeners();
  }

  addCartPage(Item model, String key) async {
    await cartItems.put(key, model);
    notifyListeners();
  }

  deleteFromCartPage(String key) async {
    await cartItems.delete(key);
    notifyListeners();
  }
}
