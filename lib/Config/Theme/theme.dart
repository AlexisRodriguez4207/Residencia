import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade400,
    tertiary: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade800,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 16.sp, color: Colors.grey.shade700),
    titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade800),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade600,
    inversePrimary: Colors.grey.shade500,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 16.sp, color: Colors.white54),
    titleLarge: TextStyle(
        fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white54),
  ),
);
