import 'dart:io';
import 'package:furniture_app/core/models/furniture_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveInitialize {
  static initHive() async {
    Directory hiveDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(hiveDirectory.path);
    Hive.registerAdapter(FurnitureModelAdapter());
    Hive.registerAdapter(ItemAdapter());

    await Hive.openBox<FurnitureModel>("mebel");
  }
}
