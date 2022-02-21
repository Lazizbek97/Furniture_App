import 'package:flutter/foundation.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:furniture_app/core/models/furniture_model.dart';
import 'package:furniture_app/core/services/furnitures_service/furniture_service.dart';
import 'package:hive/hive.dart';

class FurnitureProvider extends ChangeNotifier {
  Box<FurnitureModel> models = Boxes.getMebel();

  Future<Box<FurnitureModel>> loadData() async {
    if (models.isEmpty) {
      List<FurnitureModel> data = await FurnitureService.fetchData();
      for (var item in data) {
        await models.add(item);
      }
    }
    return models;
  }
}

class HomePageProvider extends ChangeNotifier {
  int menuIndex = 0;

  void changeMenu(int i) {
    menuIndex = i;
    notifyListeners();
  }
}
