import 'package:flutter/foundation.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:hive/hive.dart';

import '../../../core/models/furniture_model.dart';

class CartProvider extends ChangeNotifier {
  Box<Item> cartItems = Boxes.getCartItems();

  updateFavorite() {
    // favorites.containsKey("key");
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
