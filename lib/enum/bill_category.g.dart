// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillCategoryAdapter extends TypeAdapter<BillCategory> {
  @override
  final int typeId = 2;

  @override
  BillCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BillCategory.general;
      case 1:
        return BillCategory.utility;
      case 2:
        return BillCategory.entertainment;
      case 3:
        return BillCategory.auto;
      case 4:
        return BillCategory.rent;
      case 5:
        return BillCategory.mortgage;
      default:
        return BillCategory.general;
    }
  }

  @override
  void write(BinaryWriter writer, BillCategory obj) {
    switch (obj) {
      case BillCategory.general:
        writer.writeByte(0);
        break;
      case BillCategory.utility:
        writer.writeByte(1);
        break;
      case BillCategory.entertainment:
        writer.writeByte(2);
        break;
      case BillCategory.auto:
        writer.writeByte(3);
        break;
      case BillCategory.rent:
        writer.writeByte(4);
        break;
      case BillCategory.mortgage:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
