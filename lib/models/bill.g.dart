// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillAdapter extends TypeAdapter<Bill> {
  @override
  final int typeId = 0;

  @override
  Bill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bill(
      title: fields[0] as String,
      dateCreated: fields[1] as DateTime,
      startDate: fields[2] as DateTime,
      repeat: fields[4] as bool,
      cost: fields[6] as double,
      notify: fields[10] as bool,
      type: fields[11] as BillType,
      category: fields[12] as BillCategory,
      costHistory: (fields[7] as Map?)?.cast<DateTime, double>(),
      color: fields[9] as Color?,
      icon: fields[8] as IconData?,
      endDate: fields[3] as DateTime?,
      occurrence: fields[5] as Occurrence?,
    );
  }

  @override
  void write(BinaryWriter writer, Bill obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.dateCreated)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.repeat)
      ..writeByte(5)
      ..write(obj.occurrence)
      ..writeByte(6)
      ..write(obj.cost)
      ..writeByte(7)
      ..write(obj.costHistory)
      ..writeByte(8)
      ..write(obj.icon)
      ..writeByte(9)
      ..write(obj.color)
      ..writeByte(10)
      ..write(obj.notify)
      ..writeByte(11)
      ..write(obj.type)
      ..writeByte(12)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
