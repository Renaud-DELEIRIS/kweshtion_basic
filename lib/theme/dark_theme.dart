import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.grey.shade900,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade600,
    onPrimary: const Color.fromRGBO(
        255, 255, 255, 1), // White color for text on dark theme primary
    onBackground: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade800,
    elevation: 0,
    foregroundColor: Colors.white,
    scrolledUnderElevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade700,
      foregroundColor: Colors.white,
    ),
  ),
);
