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
      reviews: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.reviews);
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
