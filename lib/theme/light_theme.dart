import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade50,
    // #373c3f
    primary: Color.fromRGBO(55, 60, 63, 1),
    secondary: Colors.grey.shade400,
    tertiary: Colors.grey.shade200,
    // #1C1C1C
    onPrimary: Color.fromRGBO(28, 28, 28, 1),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.black,
    scrolledUnderElevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.black,
    ),
  ),
  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontSize: 20,
      height: 1.4,
      fontWeight: FontWeight.w500,
      // #1a1a1b
      color: Color.fromRGBO(26, 26, 27, 1),
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
