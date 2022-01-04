// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendenceModelAdapter extends TypeAdapter<AttendenceModel> {
  @override
  final int typeId = 1;

  @override
  AttendenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendenceModel(
      id: fields[0] as String,
      rollnumberlist: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AttendenceModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rollnumberlist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
