// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddTaskModelAdapter extends TypeAdapter<AddTaskModel> {
  @override
  final int typeId = 2;

  @override
  AddTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddTaskModel(
      title: fields[1] as String,
      time: fields[2] as String,
      category: fields[3] as TaskCategory,
      date: fields[4] as String,
      id: fields[5] as String,
      status: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddTaskModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
