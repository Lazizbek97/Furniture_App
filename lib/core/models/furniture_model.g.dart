// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furniture_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FurnitureModelAdapter extends TypeAdapter<FurnitureModel> {
  @override
  final int typeId = 0;

  @override
  FurnitureModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FurnitureModel(
      title: fields[0] as String?,
      icon: fields[1] as String?,
      items: (fields[2] as List?)?.cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, FurnitureModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FurnitureModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 1;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      name: fields[0] as String?,
      img: (fields[1] as List?)?.cast<String>(),
      price: fields[2] as double?,
      disc: fields[3] as String?,
      ratings: fields[4] as double?,
      reviews: (fields[5] as List?)?.cast<Review>(),
      isFavorite: fields[6] as bool?,
      count: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.img)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.disc)
      ..writeByte(4)
      ..write(obj.ratings)
      ..writeByte(5)
      ..write(obj.reviews)
      ..writeByte(6)
      ..write(obj.isFavorite)
      ..writeByte(7)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewAdapter extends TypeAdapter<Review> {
  @override
  final int typeId = 2;

  @override
  Review read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Review(
      name: fields[0] as String?,
      comment: fields[1] as String?,
      date: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Review obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
