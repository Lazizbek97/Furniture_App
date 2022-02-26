import 'package:flutter/foundation.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:hive/hive.dart';

import '../../../core/models/furniture_model.dart';

class IsFavoriteProvider extends ChangeNotifier {
  Box<Item> favorites = Boxes.getFavorites();

  updateFavorite() {
    // favorites.containsKey("key");
  }

  addFavorites(Item model, String key) async {
    await favorites.put(key, model);
    notifyListeners();
  }

  deleteFromFavorites(String key) async {
    await favorites.delete(key);
    notifyListeners();
  }
}
