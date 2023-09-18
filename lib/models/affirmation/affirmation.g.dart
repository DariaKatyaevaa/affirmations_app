// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affirmation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AffirmationAdapter extends TypeAdapter<_$_Affirmation> {
  @override
  final int typeId = 0;

  @override
  _$_Affirmation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Affirmation(
      id: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Affirmation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AffirmationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Affirmation _$$_AffirmationFromJson(Map<String, dynamic> json) =>
    _$_Affirmation(
      id: json['id'] as int,
      text: json['advice'] as String,
    );

Map<String, dynamic> _$$_AffirmationToJson(_$_Affirmation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advice': instance.text,
    };
