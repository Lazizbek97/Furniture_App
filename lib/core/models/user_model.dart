// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 3)
class UserModel {
  UserModel({
    this.name,
    this.email,
    this.password,
    this.image,
    this.myCart,
    this.favorites,
    this.notifications,
    this.myReviews,
    this.paymentMethods,
    this.shippingAddress,
    this.orders,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? image;
  @HiveField(4)
  List<dynamic>? myCart;
  @HiveField(5)
  List<dynamic>? favorites;
  @HiveField(6)
  List<NotificationModel>? notifications;
  @HiveField(7)
  List<MyReview>? myReviews;
  @HiveField(8)
  List<PaymentMethod>? paymentMethods;
  @HiveField(9)
  List<ShippingAddress>? shippingAddress;
  @HiveField(10)
  Orders? orders;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
        myCart: List<dynamic>.from(json["my_cart"].map((x) => x)),
        favorites: List<dynamic>.from(json["favorites"].map((x) => x)),
        notifications: List<NotificationModel>.from(json["notifications"].map((x) => x)),
        myReviews: List<MyReview>.from(
            json["my_reviews"].map((x) => MyReview.fromJson(x))),
        paymentMethods: List<PaymentMethod>.from(
            json["payment_methods"].map((x) => PaymentMethod.fromJson(x))),
        shippingAddress: List<ShippingAddress>.from(
            json["shipping_address"].map((x) => ShippingAddress.fromJson(x))),
        orders: Orders.fromJson(json["orders"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "image": image,
        "my_cart": List<dynamic>.from(myCart!.map((x) => x)),
        "favorites": List<dynamic>.from(favorites!.map((x) => x)),
        "notifications": List<dynamic>.from(notifications!.map((x) => x)),
        "my_reviews": List<dynamic>.from(myReviews!.map((x) => x.toJson())),
        "payment_methods":
            List<dynamic>.from(paymentMethods!.map((x) => x.toJson())),
        "shipping_address":
            List<dynamic>.from(shippingAddress!.map((x) => x.toJson())),
        "orders": orders!.toJson(),
      };
}

@HiveType(typeId: 4)
class MyReview {
  MyReview({
    this.name,
    this.price,
    this.rating,
    this.date,
    this.review,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? price;
  @HiveField(2)
  int? rating;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? review;

  factory MyReview.fromJson(Map<String, dynamic> json) => MyReview(
        name: json["name"],
        price: json["price"],
        rating: json["rating"],
        date: json["date"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "rating": rating,
        "date": date,
        "review": review,
      };
}

@HiveType(typeId: 5)
class Orders {
  Orders({
    this.delivered,
    this.proccessing,
    this.canceled,
  });
  @HiveField(0)
  List<Canceled>? delivered;
  @HiveField(1)
  List<Canceled>? proccessing;
  @HiveField(2)
  List<Canceled>? canceled;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        delivered: List<Canceled>.from(
            json["delivered"].map((x) => Canceled.fromJson(x))),
        proccessing: List<Canceled>.from(
            json["proccessing"].map((x) => Canceled.fromJson(x))),
        canceled: List<Canceled>.from(
            json["canceled"].map((x) => Canceled.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "delivered": List<dynamic>.from(delivered!.map((x) => x.toJson())),
        "proccessing": List<dynamic>.from(proccessing!.map((x) => x.toJson())),
        "canceled": List<dynamic>.from(canceled!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 6)
class Canceled {
  Canceled({
    this.id,
    this.date,
    this.quantity,
    this.totalAmount,
    this.items,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? date;
  @HiveField(2)
  int? quantity;
  @HiveField(3)
  int? totalAmount;
  @HiveField(4)
  List<dynamic>? items;

  factory Canceled.fromJson(Map<String, dynamic> json) => Canceled(
        id: json["id"],
        date: json["date"],
        quantity: json["quantity"],
        totalAmount: json["total_amount"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "quantity": quantity,
        "total_amount": totalAmount,
        "items": List<dynamic>.from(items!.map((x) => x)),
      };
}

@HiveType(typeId: 7)
class PaymentMethod {
  PaymentMethod({
    this.holderName,
    this.cardNumber,
    this.cvvCode,
    this.expirationDate,
  });
  @HiveField(0)
  String? holderName;
  @HiveField(1)
  String? cardNumber;
  @HiveField(2)
  String? cvvCode;
  @HiveField(3)
  String? expirationDate;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        holderName: json["holder_name"],
        cardNumber: json["card_number"],
        cvvCode: json["cvv_code"],
        expirationDate: json["expiration_date"],
      );

  Map<String, dynamic> toJson() => {
        "holder_name": holderName,
        "card_number": cardNumber,
        "cvv_code": cvvCode,
        "expiration_date": expirationDate,
      };
}

@HiveType(typeId: 8)
class ShippingAddress {
  ShippingAddress({
    this.name,
    this.address,
    this.zipCode,
    this.country,
    this.city,
    this.district,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? address;
  @HiveField(2)
  int? zipCode;
  @HiveField(3)
  String? country;
  @HiveField(4)
  String? city;
  @HiveField(5)
  String? district;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        name: json["name"],
        address: json["address"],
        zipCode: json["zip_code"],
        country: json["country"],
        city: json["city"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "zip_code": zipCode,
        "country": country,
        "city": city,
        "district": district,
      };
}

@HiveType(typeId: 9)
class NotificationModel {
  NotificationModel({
    this.title,
    this.image,
    this.disc,
    this.category,
  });
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? image;
  @HiveField(2)
  String? disc;
  @HiveField(3)
  String? category;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json["title"],
        image: json["image"],
        disc: json["disc"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "disc": disc,
        "category": category,
      };
}
