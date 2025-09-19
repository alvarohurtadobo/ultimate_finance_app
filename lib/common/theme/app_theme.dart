import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData greenFinanceTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF4CAF50),
    primaryColorLight: const Color(0xFFC8E6C9),
    primaryColorDark: const Color(0xFF087F23),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4CAF50),
      secondary: Color(0xFF81C784),
      error: Color(0xffD32F2f),
      surface: Color(0xfff1f8e9),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Roboto',
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: 'Roboto',
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: 'Roboto',
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Roboto',
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFF087F23),
        fontFamily: 'Roboto',
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black54,
        fontFamily: 'Roboto',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff4caf50),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xff087f23)),
    dividerColor: const Color(0xffbdbdbd),
  );

  static final ThemeData greenFinanceDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF4CAF50),
    primaryColorLight: const Color(0xFF66BB6A),
    primaryColorDark: const Color(0xFF2E7D32),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4CAF50),
      secondary: Color(0xFF81C784),
      error: Color(0xffEF5350),
      surface: Color(0xFF1E1E1E), // fondo oscuro
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Roboto',
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontFamily: 'Roboto',
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontFamily: 'Roboto',
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Roboto',
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Color(0xFF81C784), // verde claro para destacar
        fontFamily: 'Roboto',
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
        fontFamily: 'Roboto',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff4caf50),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xff81C784)),
    dividerColor: Colors.grey.shade700,
  );
}
