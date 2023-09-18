// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeTypeAdapter extends TypeAdapter<ThemeType> {
  @override
  final int typeId = 4;

  @override
  ThemeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeType.natureFirst;
      case 1:
        return ThemeType.natureSecond;
      case 2:
        return ThemeType.natureThird;
      case 3:
        return ThemeType.gradientFirst;
      case 4:
        return ThemeType.gradientSecond;
      case 5:
        return ThemeType.gradientThird;
      case 6:
        return ThemeType.skyFirst;
      case 7:
        return ThemeType.skySecond;
      case 8:
        return ThemeType.skyThird;
      default:
        return ThemeType.natureFirst;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeType obj) {
    switch (obj) {
      case ThemeType.natureFirst:
        writer.writeByte(0);
        break;
      case ThemeType.natureSecond:
        writer.writeByte(1);
        break;
      case ThemeType.natureThird:
        writer.writeByte(2);
        break;
      case ThemeType.gradientFirst:
        writer.writeByte(3);
        break;
      case ThemeType.gradientSecond:
        writer.writeByte(4);
        break;
      case ThemeType.gradientThird:
        writer.writeByte(5);
        break;
      case ThemeType.skyFirst:
        writer.writeByte(6);
        break;
      case ThemeType.skySecond:
        writer.writeByte(7);
        break;
      case ThemeType.skyThird:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
