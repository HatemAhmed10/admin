// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubjectModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectModelAdapter extends TypeAdapter<SubjectModel> {
  @override
  final int typeId = 0;

  @override
  SubjectModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectModel(
      title: fields[0] as String,
      subTitle: fields[1] as String,
      color: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubjectModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
