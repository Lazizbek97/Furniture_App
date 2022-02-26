// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 3;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      name: fields[0] as String?,
      email: fields[1] as String?,
      password: fields[2] as String?,
      image: fields[3] as String?,
      myCart: (fields[4] as List?)?.cast<dynamic>(),
      favorites: (fields[5] as List?)?.cast<dynamic>(),
      notifications: (fields[6] as List?)?.cast<dynamic>(),
      myReviews: (fields[7] as List?)?.cast<MyReview>(),
      paymentMethods: (fields[8] as List?)?.cast<PaymentMethod>(),
      shippingAddress: (fields[9] as List?)?.cast<ShippingAddress>(),
      orders: fields[10] as Orders?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.myCart)
      ..writeByte(5)
      ..write(obj.favorites)
      ..writeByte(6)
      ..write(obj.notifications)
      ..writeByte(7)
      ..write(obj.myReviews)
      ..writeByte(8)
      ..write(obj.paymentMethods)
      ..writeByte(9)
      ..write(obj.shippingAddress)
      ..writeByte(10)
      ..write(obj.orders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyReviewAdapter extends TypeAdapter<MyReview> {
  @override
  final int typeId = 4;

  @override
  MyReview read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyReview(
      name: fields[0] as String?,
      price: fields[1] as String?,
      rating: fields[2] as int?,
      date: fields[3] as String?,
      review: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyReview obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.review);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyReviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrdersAdapter extends TypeAdapter<Orders> {
  @override
  final int typeId = 5;

  @override
  Orders read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Orders(
      delivered: (fields[0] as List?)?.cast<Canceled>(),
      proccessing: (fields[1] as List?)?.cast<Canceled>(),
      canceled: (fields[2] as List?)?.cast<Canceled>(),
    );
  }

  @override
  void write(BinaryWriter writer, Orders obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.delivered)
      ..writeByte(1)
      ..write(obj.proccessing)
      ..writeByte(2)
      ..write(obj.canceled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CanceledAdapter extends TypeAdapter<Canceled> {
  @override
  final int typeId = 6;

  @override
  Canceled read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Canceled(
      id: fields[0] as String?,
      date: fields[1] as String?,
      quantity: fields[2] as int?,
      totalAmount: fields[3] as int?,
      items: (fields[4] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Canceled obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.totalAmount)
      ..writeByte(4)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CanceledAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PaymentMethodAdapter extends TypeAdapter<PaymentMethod> {
  @override
  final int typeId = 7;

  @override
  PaymentMethod read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentMethod(
      holderName: fields[0] as String?,
      cardNumber: fields[1] as String?,
      cvvCode: fields[2] as String?,
      expirationDate: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentMethod obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.holderName)
      ..writeByte(1)
      ..write(obj.cardNumber)
      ..writeByte(2)
      ..write(obj.cvvCode)
      ..writeByte(3)
      ..write(obj.expirationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ShippingAddressAdapter extends TypeAdapter<ShippingAddress> {
  @override
  final int typeId = 8;

  @override
  ShippingAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShippingAddress(
      name: fields[0] as String?,
      address: fields[1] as String?,
      zipCode: fields[2] as int?,
      country: fields[3] as String?,
      city: fields[4] as String?,
      district: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShippingAddress obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.zipCode)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.district);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
