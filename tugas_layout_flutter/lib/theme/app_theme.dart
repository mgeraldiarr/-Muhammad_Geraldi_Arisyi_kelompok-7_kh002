import 'package:flutter/material.dart';

// Theme aplikasi: hanya mengatur warna (tanpa tipografi / styling font).
class AppTheme {
  AppTheme._();

  // Warna utama aplikasi
  static const Color primaryColor = Colors.blue;

  // Warna latar belakang
  static const Color backgroundColor = Colors.white;

  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          surface: backgroundColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.black87,
          surfaceTintColor: backgroundColor,
          elevation: 0,
        ),
        cardTheme: const CardThemeData(
          color: backgroundColor,
          surfaceTintColor: backgroundColor,
          elevation: 3,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      );
}
