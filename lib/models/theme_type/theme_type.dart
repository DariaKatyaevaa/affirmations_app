import 'package:flutter/material.dart';

enum ThemeCategory {
  nature('nature', 3),
  gradient('gradient', 3),
  sky('sky', 3);

  const ThemeCategory(this.text, this.count);

  final String text;
  final int count;
}

enum ThemeType {
  natureFirst(ThemeCategory.nature, 1, Color(0xFF6B6B6B)),
  natureSecond(ThemeCategory.nature, 2, Colors.black),
  natureThird(ThemeCategory.nature, 3, Colors.white),
  gradientFirst(ThemeCategory.gradient, 1, Color(0xFF6B6B6B)),
  gradientSecond(ThemeCategory.gradient, 2, Colors.white),
  gradientThird(ThemeCategory.gradient, 3, Color(0xFF6B6B6B)),
  skyFirst(ThemeCategory.sky, 1, Colors.white),
  skySecond(ThemeCategory.sky, 2, Colors.white),
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

