import 'package:flutter/material.dart';

class AppConfig {  
  // Theme colors
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF18A659,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFC3FFCE),
      200: Color(0xFF7EFBA4),
      300: Color(0xFF61DE8A),
      400: Color(0xFF41C271),
      500: Color(0xFF18A659),
      600: Color(0xFF008946),
      700: Color(0xFF006D37),
      800: Color(0xFF005228),
      900: Color(0xFF00391A),
    },
  );

    static const MaterialColor secondarySwatch = MaterialColor(
    0xFF247DB6,
    <int, Color>{
      50: Color(0xFFE7F2FF),
      100: Color(0xFFCCE5FF),
      200: Color(0xFF92CCFF),
      300: Color(0xFF65B2EE),
      400: Color(0xFF4797D1),
      500: Color(0xFF247DB6),
      600: Color(0xFF006497),
      700: Color(0xFF004B73),
      800: Color(0xFF003351),
      900: Color(0xFF001E31),
    },
  );

  static const MaterialColor tertiarySwatch = MaterialColor(
    0xFFFFEDE4,
    <int, Color>{
      50: Color(0xFFFFEDE4),
      100: Color(0xFFFFDCC5),
      200: Color(0xFFFFB783),
      300: Color(0xFFFF8F34),
      400: Color(0xFFFF7619),
      500: Color(0xFFFF5F00),
      600: Color(0xFFFF4A00),
      700: Color(0xFFFF3700),
      800: Color(0xFFFF2500),
      900: Color(0xFFFF1400),
    },
  );
  // Make a gray neutral MaterialColor swatch with #333 as 500

  static const MaterialColor neutralSwatch = MaterialColor(
    0xFF333333,
    <int, Color>{
      50: Color(0xFFEDEDED),
      100: Color(0xFFD9D9D9),
      200: Color(0xFFBFBFBF),
      300: Color(0xFFA6A6A6),
      400: Color(0xFF8C8C8C),
      500: Color(0xFF333333),
      600: Color(0xFF1A1A1A),
      700: Color(0xFF0D0D0D),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  // Fonts
  // Google Font Fonts 
  static const String headlineFont = 'Epilogue';
  static const String bodyFont = 'Manrope';
  static const String labelFont = 'Space Grotesk';
}