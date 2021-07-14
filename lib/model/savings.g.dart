// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavingsAdapter extends TypeAdapter<Savings> {
  @override
  final int typeId = 0;

  @override
  Savings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Savings(
      name: fields[0] as String?,
      money: fields[1] as String?,
      dorm: fields[2] as String?,
      date: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Savings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.money)
      ..writeByte(2)
      ..write(obj.dorm)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
