import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.grey.shade900,
  ),
  scaffoldBackgroundColor: Colors.grey.shade900,
  indicatorColor: Colors.grey.shade200,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade600,
    onPrimary: const Color.fromRGBO(255, 255, 255, 1),
    onSecondary: const Color.fromRGBO(240, 240, 240, 1),
    onBackground: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900,
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
