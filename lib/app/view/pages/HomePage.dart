import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConfig.neutralSwatch[500],
        appBar: AppBar(
          title: Text(
            'Ana\s Finance Hub',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: GoogleFonts.epilogue().fontFamily,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppConfig.neutralSwatch[500],
          titleTextStyle: TextStyle(
            color: AppConfig.primarySwatch[300],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}