import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/pages/HomePage.dart';
import 'package:aurora_finance/app/view/pages/IncomeInputPage.dart';
import 'package:google_fonts/google_fonts.dart';

class AuroraApp extends StatelessWidget {
  const AuroraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/income-input': (context) => IncomeInputPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConfig.primarySwatch[500]!),
        scaffoldBackgroundColor: AppConfig.backgroundColor,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.manrope().fontFamily,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.manrope().fontFamily,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.manrope().fontFamily,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
      ),
      title: 'Cash Flow',
      home: HomePage(),
    );
  }
}