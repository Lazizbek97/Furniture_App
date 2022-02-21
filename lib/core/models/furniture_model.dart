// To parse this JSON data, do
//
//     final furnitureModel = furnitureModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'furniture_model.g.dart';

List<FurnitureModel> furnitureModelFromJson(String str) =>
    List<FurnitureModel>.from(
        json.decode(str).map((x) => FurnitureModel.fromJson(x)));

String furnitureModelToJson(List<FurnitureModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class FurnitureModel extends HiveObject {
  FurnitureModel({
    this.title,
    this.icon,
    this.items,
  });

  @HiveField(0)
  String? title;
  @HiveField(1)
  String? icon;
  @HiveField(2)
  List<Item>? items;

  factory FurnitureModel.fromJson(Map<String, dynamic> json) => FurnitureModel(
        title: json["title"],
        icon: json["icon"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 1)
class Item {
  Item({
    this.name,
    this.img,
    this.price,
    this.disc,
    this.ratings,
    this.reviews,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  List<String>? img;
  @HiveField(2)
  double? price;
  @HiveField(3)
  String? disc;
  @HiveField(4)
  double? ratings;
  @HiveField(5)
  List<String>? reviews;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        img: List<String>.from(json["img"].map((x) => x)),
        price: json["price"].toDouble(),
        disc: json["disc"],
        ratings: json["ratings"].toDouble(),
        reviews: List<String>.from(json["reviews"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": List<dynamic>.from(img!.map((x) => x)),
        "price": price,
        "disc": disc,
        "ratings": ratings,
        "reviews": List<dynamic>.from(reviews!.map((x) => x)),
      };
}
