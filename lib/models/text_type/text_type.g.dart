// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextTypeAdapter extends TypeAdapter<TextType> {
  @override
  final int typeId = 3;

  @override
  TextType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TextType.affirmation;
      case 1:
        return TextType.quote;
      default:
        return TextType.affirmation;
    }
  }

  @override
  void write(BinaryWriter writer, TextType obj) {
    switch (obj) {
      case TextType.affirmation:
        writer.writeByte(0);
        break;
      case TextType.quote:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
