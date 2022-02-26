// To parse this JSON data, do
//
//     final furnitureModel = furnitureModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'furniture_model.g.dart';

// To parse this JSON data, do
//
//     final furnitureModel = furnitureModelFromJson(jsonString);

List<FurnitureModel> furnitureModelFromJson(String str) =>
    List<FurnitureModel>.from(
        json.decode(str).map((x) => FurnitureModel.fromJson(x)));

String furnitureModelToJson(List<FurnitureModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class FurnitureModel {
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
    this.isFavorite,
    this.count,
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
  List<Review>? reviews;
  @HiveField(6)
  bool? isFavorite;
  @HiveField(7)
  int? count;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        img: List<String>.from(json["img"].map((x) => x)),
        price: json["price"].toDouble(),
        disc: json["disc"],
        ratings: json["ratings"].toDouble(),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        isFavorite: json["isFavorite"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": List<dynamic>.from(img!.map((x) => x)),
        "price": price,
        "disc": disc,
        "ratings": ratings,
        "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "isFavorite": isFavorite,
        "count": count,
      };
}

@HiveType(typeId: 2)
class Review {
  Review({
    this.name,
    this.comment,
    this.date,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? comment;
  @HiveField(2)
  String? date;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        name: json["name"],
        comment: json["comment"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "comment": comment,
        "date": date,
      };
}
