// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occurance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OccuranceAdapter extends TypeAdapter<Occurance> {
  @override
  final int typeId = 3;

  @override
  Occurance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Occurance.day;
      case 1:
        return Occurance.week;
      case 2:
        return Occurance.month;
      case 3:
        return Occurance.quarter;
      case 4:
        return Occurance.year;
      default:
        return Occurance.day;
    }
  }

  @override
  void write(BinaryWriter writer, Occurance obj) {
    switch (obj) {
      case Occurance.day:
        writer.writeByte(0);
        break;
      case Occurance.week:
        writer.writeByte(1);
        break;
      case Occurance.month:
        writer.writeByte(2);
        break;
      case Occurance.quarter:
        writer.writeByte(3);
        break;
      case Occurance.year:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OccuranceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
