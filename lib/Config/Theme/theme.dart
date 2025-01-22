import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: const Color.fromARGB(255, 35, 35, 35),
    secondary: const Color.fromARGB(255, 78, 77, 77),
    tertiary: Colors.grey.shade100,
    inversePrimary: const Color.fromARGB(255, 0, 0, 0),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
        fontSize: 16.sp, color: const Color.fromARGB(255, 147, 145, 145)),
    titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 147, 145, 145)),
    titleMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 0, 0, 0)),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: const Color.fromARGB(255, 237, 236, 236),
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade600,
    inversePrimary: const Color.fromARGB(255, 0, 0, 0),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 16.sp, color: Colors.white70),
    titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 250, 248, 248)),
    titleMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 249, 249, 249)),
  ),
);
