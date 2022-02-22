// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.name,
    this.email,
    this.password,
    this.myCart,
    this.favorites,
    this.notifications,
    this.myReviews,
    this.paymentMethods,
    this.shippingAddress,
    this.orders,
  });

  String? name;
  String? email;
  String? password;
  List<dynamic>? myCart;
  List<dynamic>? favorites;
  List<dynamic>? notifications;
  List<MyReview>? myReviews;
  List<PaymentMethod>? paymentMethods;
  List<ShippingAddress>? shippingAddress;
  Orders? orders;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        myCart: List<dynamic>.from(json["my_cart"].map((x) => x)),
        favorites: List<dynamic>.from(json["favorites"].map((x) => x)),
        notifications: List<dynamic>.from(json["notifications"].map((x) => x)),
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

class MyReview {
  MyReview({
    this.name,
    this.price,
    this.rating,
    this.date,
    this.review,
  });

  String? name;
  String? price;
  int? rating;
  String? date;
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

class Orders {
  Orders({
    this.delivered,
    this.proccessing,
    this.canceled,
  });

  List<Canceled>? delivered;
  List<Canceled>? proccessing;
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

class Canceled {
  Canceled({
    this.id,
    this.date,
    this.quantity,
    this.totalAmount,
    this.items,
  });

  String? id;
  String? date;
  int? quantity;
  int? totalAmount;
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

class PaymentMethod {
  PaymentMethod({
    this.holderName,
    this.cardNumber,
    this.cvvCode,
    this.expirationDate,
  });

  String? holderName;
  String? cardNumber;
  String? cvvCode;
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

class ShippingAddress {
  ShippingAddress({
    this.name,
    this.address,
    this.zipCode,
    this.country,
    this.city,
    this.district,
  });

  String? name;
  String? address;
  int? zipCode;
  String? country;
  String? city;
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
