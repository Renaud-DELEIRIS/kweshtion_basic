import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.grey.shade50,
  indicatorColor: Colors.grey.shade800,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade50,
    // #373c3f
    primary: const Color.fromRGBO(55, 60, 63, 1),
    secondary: Colors.grey.shade400,
    tertiary: Colors.grey.shade200,
    // #1C1C1C
    onPrimary: const Color.fromRGBO(28, 28, 28, 1),
    // #1a1a1b
    onSecondary: const Color.fromRGBO(26, 26, 27, 1),
    onBackground: const Color.fromRGBO(26, 26, 27, 1),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade50,
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
);
