import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Colors.white,
  ),
);
