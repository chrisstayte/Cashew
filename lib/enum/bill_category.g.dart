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
        return BillCategory.housing;
      case 5:
        return BillCategory.healthCare;
      case 6:
        return BillCategory.studentLoan;
      case 7:
        return BillCategory.fitness;
      case 8:
        return BillCategory.sports;
      case 9:
        return BillCategory.food;
      case 10:
        return BillCategory.insurance;
      case 11:
        return BillCategory.telephone;
      case 12:
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
      case BillCategory.housing:
        writer.writeByte(4);
        break;
      case BillCategory.healthCare:
        writer.writeByte(5);
        break;
      case BillCategory.studentLoan:
        writer.writeByte(6);
        break;
      case BillCategory.fitness:
        writer.writeByte(7);
        break;
      case BillCategory.sports:
        writer.writeByte(8);
        break;
      case BillCategory.food:
        writer.writeByte(9);
        break;
      case BillCategory.insurance:
        writer.writeByte(10);
        break;
      case BillCategory.telephone:
        writer.writeByte(11);
        break;
      case BillCategory.parking:
        writer.writeByte(12);
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
