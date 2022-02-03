// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PointModelAdapter extends TypeAdapter<PointModel> {
  @override
  final int typeId = 1;

  @override
  PointModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PointModel(
      point: fields[2] as int?,
      subtitl: fields[1] as String?,
      titl: fields[0] as String?,
      id: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PointModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.titl)
      ..writeByte(1)
      ..write(obj.subtitl)
      ..writeByte(2)
      ..write(obj.point);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PointModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
