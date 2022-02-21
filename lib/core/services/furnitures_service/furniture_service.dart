import 'package:furniture_app/core/data/local_data/local_data.dart';

import '../../models/furniture_model.dart';

class FurnitureService {
  static Future<List<FurnitureModel>> fetchData() async {
    
    return (Furnitures.data["menu"] as List)
        .map((e) => FurnitureModel.fromJson(e))
        .toList();
  }
}
