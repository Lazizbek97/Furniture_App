import 'package:flutter/foundation.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:hive/hive.dart';

import '../../../core/models/furniture_model.dart';

class CartProvider extends ChangeNotifier {
  Box<Item> cartItems = Boxes.getCartItems();

  int modelCount = 1;
  double total = 0;

  bool cartNotEmpty = Boxes.getCartItems().values.length == 0?false:true;
  int numCartItems = Boxes.getCartItems().values.length;

  checkBox() async {
    cartItems.values.length == 0 ? cartNotEmpty = false : cartNotEmpty = true;
    numCartItems = cartItems.values.length;
    notifyListeners();
  }

  totalSum({double discount = 0}) {
    total = 0;
    cartItems.values.toList().forEach((element) {
      total = total + (element.price! * element.count!);
    });
    total = double.parse((total - discount).toStringAsFixed(3));
    numCartItems = cartItems.values.length;

    notifyListeners();
  }

  addCount(Item model) {
    model.count = model.count! + 1;

    modelCount = model.count!;
    numCartItems = cartItems.values.length;

    notifyListeners();
  }

  removeCount(Item model) {
    if (model.count! > 1) {
      model.count = model.count! - 1;
    }
    modelCount = model.count!;
    numCartItems = cartItems.values.length;

    notifyListeners();
  }

  addCartPage(Item model, String key) async {
    await cartItems.put(key, model);
    numCartItems = cartItems.values.length;
    cartItems.values.length == 0 ? cartNotEmpty = false : cartNotEmpty = true;

    notifyListeners();
  }

  deleteFromCartPage(String key) async {
    await cartItems.delete(key);
    numCartItems = cartItems.values.length;
    cartItems.values.length == 0 ? cartNotEmpty = false : cartNotEmpty = true;

    notifyListeners();
  }
}
