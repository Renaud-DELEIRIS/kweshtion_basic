import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    tertiary: Colors.grey.shade200,
    onPrimary: Colors.grey.shade900,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.black,
    ),
  ),
  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontSize: 28,
      color: Colors.grey.shade800,
    ),
    labelSmall: TextStyle(
      fontSize: 20,
      color: Colors.grey.shade700,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      color: Colors.grey.shade800,
    ),
  ),
);
