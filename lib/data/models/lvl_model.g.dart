// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lvl_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LVLModelAdapter extends TypeAdapter<LVLModel> {
  @override
  final int typeId = 3;

  @override
  LVLModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LVLModel(
      experience: fields[0] as double?,
      lvls: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LVLModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.experience)
      ..writeByte(1)
      ..write(obj.lvls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LVLModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
