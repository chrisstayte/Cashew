// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occurrence.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OccurrenceAdapter extends TypeAdapter<Occurrence> {
  @override
  final int typeId = 3;

  @override
  Occurrence read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Occurrence.day;
      case 1:
        return Occurrence.week;
      case 2:
        return Occurrence.month;
      case 3:
        return Occurrence.biannual;
      case 4:
        return Occurrence.year;
      default:
        return Occurrence.day;
    }
  }

  @override
  void write(BinaryWriter writer, Occurrence obj) {
    switch (obj) {
      case Occurrence.day:
        writer.writeByte(0);
        break;
      case Occurrence.week:
        writer.writeByte(1);
        break;
      case Occurrence.month:
        writer.writeByte(2);
        break;
      case Occurrence.biannual:
        writer.writeByte(3);
        break;
      case Occurrence.year:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OccurrenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
