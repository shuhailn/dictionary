// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchwordmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchWordModelAdapter extends TypeAdapter<SearchWordModel> {
  @override
  final int typeId = 0;

  @override
  SearchWordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchWordModel(
      id: fields[0] as int?,
      key: fields[1] as String,
      englishWword: fields[2] as String,
      wordType: fields[3] as String,
      malayalamWord: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchWordModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.englishWword)
      ..writeByte(3)
      ..write(obj.wordType)
      ..writeByte(4)
      ..write(obj.malayalamWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchWordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
