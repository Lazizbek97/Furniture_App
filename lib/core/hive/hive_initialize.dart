import 'dart:io';
import 'package:furniture_app/core/models/furniture_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../models/user_model.dart';

class HiveInitialize {
  static initHive() async {
    Directory hiveDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(hiveDirectory.path);
    Hive.registerAdapter(FurnitureModelAdapter());
    Hive.registerAdapter(ItemAdapter());
    Hive.registerAdapter(ReviewAdapter());

    await Hive.openBox<FurnitureModel>("mebel");
    await Hive.openBox<Item>("favorites");
    await Hive.openBox<Item>("cart");

    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(MyReviewAdapter());
    Hive.registerAdapter(OrdersAdapter());
    Hive.registerAdapter(CanceledAdapter());
    Hive.registerAdapter(PaymentMethodAdapter());
    Hive.registerAdapter(ShippingAddressAdapter());
    Hive.registerAdapter(NotificationModelAdapter());
  }
}
