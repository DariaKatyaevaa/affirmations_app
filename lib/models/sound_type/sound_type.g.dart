// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoundTypeAdapter extends TypeAdapter<SoundType> {
  @override
  final int typeId = 2;

  @override
  SoundType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SoundType.rain;
      case 1:
        return SoundType.forest;
      case 2:
        return SoundType.night;
      case 3:
        return SoundType.relax;
      default:
        return SoundType.rain;
    }
  }

  @override
  void write(BinaryWriter writer, SoundType obj) {
    switch (obj) {
      case SoundType.rain:
        writer.writeByte(0);
        break;
      case SoundType.forest:
        writer.writeByte(1);
        break;
      case SoundType.night:
        writer.writeByte(2);
        break;
      case SoundType.relax:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoundTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
