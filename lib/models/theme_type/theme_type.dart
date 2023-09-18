import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'theme_type.g.dart';

enum ThemeCategory {
  nature('nature', 3),
  gradient('gradient', 3),
  sky('sky', 3);

  const ThemeCategory(this.text, this.count);

  final String text;
  final int count;
}

@HiveType(typeId: 4)
enum ThemeType {
  @HiveField(0)
  natureFirst(ThemeCategory.nature, 1, Color(0xFF6B6B6B)),
  @HiveField(1)
  natureSecond(ThemeCategory.nature, 2, Colors.black),
  @HiveField(2)
  natureThird(ThemeCategory.nature, 3, Colors.white),
  @HiveField(3)
  gradientFirst(ThemeCategory.gradient, 1, Color(0xFF6B6B6B)),
  @HiveField(4)
  gradientSecond(ThemeCategory.gradient, 2, Colors.white),
  @HiveField(5)
  gradientThird(ThemeCategory.gradient, 3, Color(0xFF6B6B6B)),
  @HiveField(6)
  skyFirst(ThemeCategory.sky, 1, Colors.white),
  @HiveField(7)
  skySecond(ThemeCategory.sky, 2, Colors.white),
  @HiveField(8)
  skyThird(ThemeCategory.sky, 3, Colors.white);

  const ThemeType(
    this.themeCategory,
    this.number,
    this.textColor,
  );

  final ThemeCategory themeCategory;
  final int number;
  final Color textColor;

  String toAsset() => "assets/images/${themeCategory.text}/$number.jpg";
}
