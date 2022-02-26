import 'package:furniture_app/core/models/furniture_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<FurnitureModel> getMebel() => Hive.box<FurnitureModel>("mebel");
  static Box<Item> getFavorites() => Hive.box<Item>("favorites");
  static Box<Item> getCartItems() => Hive.box<Item>("cart");
}
