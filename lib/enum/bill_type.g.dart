// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillTypeAdapter extends TypeAdapter<BillType> {
  @override
  final int typeId = 1;

  @override
  BillType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BillType.utility;
      case 1:
        return BillType.subscription;
      case 2:
        return BillType.financed;
      default:
        return BillType.utility;
    }
  }

  @override
  void write(BinaryWriter writer, BillType obj) {
    switch (obj) {
      case BillType.utility:
        writer.writeByte(0);
        break;
      case BillType.subscription:
        writer.writeByte(1);
        break;
      case BillType.financed:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
