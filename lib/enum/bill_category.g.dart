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
      case 6:
        return BillCategory.healthCare;
      case 7:
        return BillCategory.studenLoan;
      case 8:
        return BillCategory.gym;
      case 9:
        return BillCategory.sports;
      case 10:
        return BillCategory.food;
      case 11:
        return BillCategory.insurance;
      case 12:
        return BillCategory.telephone;
      case 13:
        return BillCategory.parking;
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
      case BillCategory.healthCare:
        writer.writeByte(6);
        break;
      case BillCategory.studenLoan:
        writer.writeByte(7);
        break;
      case BillCategory.gym:
        writer.writeByte(8);
        break;
      case BillCategory.sports:
        writer.writeByte(9);
        break;
      case BillCategory.food:
        writer.writeByte(10);
        break;
      case BillCategory.insurance:
        writer.writeByte(11);
        break;
      case BillCategory.telephone:
        writer.writeByte(12);
        break;
      case BillCategory.parking:
        writer.writeByte(13);
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
