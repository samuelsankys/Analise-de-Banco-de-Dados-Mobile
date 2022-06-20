// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelAdapter extends TypeAdapter<HiveModel> {
  @override
  final int typeId = 0;

  @override
  HiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModel(
      fields[0] as int,
      fields[1] as double,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.A0)
      ..writeByte(1)
      ..write(obj.A1)
      ..writeByte(2)
      ..write(obj.A2)
      ..writeByte(3)
      ..write(obj.A3)
      ..writeByte(4)
      ..write(obj.A4)
      ..writeByte(5)
      ..write(obj.A5);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
