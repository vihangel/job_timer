import 'package:flutter/material.dart';

class AppConfigUI {
  AppConfigUI._();
  static const MaterialColor _primarySwatch = MaterialColor(0XFF0066B0, {
    50: Color(0XFF0066b0),
    100: Color(0XFF005c9e),
    200: Color(0XFF00528d),
    300: Color(0XFF00477b),
    400: Color(0XFF003d6a),
    500: Color(0XFF003358),
    600: Color(0XFF002946),
    700: Color(0XFF001f35),
    800: Color(0XFF001423),
    900: Color(0XFF000a12),
  });

  static final ThemeData theme = ThemeData(
    primaryColor: _primarySwatch,
    primaryColorLight: const Color(0XFF219FFF),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
