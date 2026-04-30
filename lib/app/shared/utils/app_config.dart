import 'package:flutter/material.dart';

class AppConfig {
  // Theme colors
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF00E5FF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFD2F7FF),
      200: Color(0xFF9CF0FF),
      300: Color(0xFF00DAF3),
      400: Color(0xFF00BCD2),
      500: Color(0xFF009FB2),
      600: Color(0xFF008393),
      700: Color(0xFF006875),
      800: Color(0xFF004F58),
      900: Color(0xFF00363D),
    },
  );

  static const MaterialColor secondarySwatch = MaterialColor(
    0xFFB388FF,
    <int, Color>{
      50: Color(0xFFF7EDFF),
      100: Color(0xFFEBDCFF),
      200: Color(0xFFD4BBFF),
      300: Color(0xFFBE99FF),
      400: Color(0xFFA57AF0),
      500: Color(0xFF8A60D3),
      600: Color(0xFF8A60D3),
      700: Color(0xFF582A9F),
      800: Color(0xFF400688),
    },
  );

  static const MaterialColor tertiarySwatch = MaterialColor(
    0xFFFF3366,
    <int, Color>{
      50: Color(0xFFFFECED),
      100: Color(0xFFFFD9DC),
      200: Color(0xFFFFD9DC),
      300: Color(0xFFFFB2BA),
      400: Color(0xFFFF4F73),
      500: Color(0xFFE71C56),
      600: Color(0xFFBD0042),
      700: Color(0xFF670020),
      800: Color(0xFF400011),
    },
  );
  static const Color neutralColor = Color(0xFF090A0F);

  // Fonts
  // Google Font Fonts 
  static const String headlineFont = 'Epilogue';
  static const String bodyFont = 'Manrope';
  static const String labelFont = 'Space Grotesk';
}