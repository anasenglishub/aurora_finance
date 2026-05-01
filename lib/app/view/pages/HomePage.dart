import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/ActionButtonts.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/Balance.dart';
import 'package:aurora_finance/app/view/widgets/Card.dart';
import 'package:aurora_finance/app/view/widgets/RecentPurchases.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> actionButtons = [
    {'icon': Icons.swap_horiz, 'label': 'TRANSFER', 'iconColor': AppConfig.primarySwatch[300]},
    {'icon': Icons.add, 'label': 'DEPOSIT', 'iconColor': AppConfig.secondarySwatch[300]},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConfig.neutralColor,
        appBar: AppBar(
          title: Text(
            'AURORA FINANCE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: GoogleFonts.epilogue().fontFamily,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppConfig.neutralColor,
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
                CardWidget(
                  withBlurPattern: true,
                  blurColorLight: AppConfig.primarySwatch[300]!,
                  blurColorDark: AppConfig.primarySwatch[500]!,
                  child: Column(
                    children: [
                      Balance(),
                    ],
                  ),
                ),
                // Actions
                ActionButtons(actionButtons: actionButtons),
                RecentPurchases(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}