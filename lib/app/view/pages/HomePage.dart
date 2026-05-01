import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/Balance.dart';
import 'package:aurora_finance/app/view/widgets/Card.dart';
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
              Stack(
                children: [
                  Row(
                    spacing: 10,
                    children: actionButtons.map((button) {
                    return GestureDetector(
                      onTap: () {},
                      child: CardWidget(
                        withBlurPattern: false,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(button['icon'], color: button['iconColor']),
                            ),
                            Text(
                              button['label'],
                              style: GoogleFonts.spaceGrotesk().copyWith(
                                color: AppConfig.primarySwatch[50],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Positioned(
                  top: 20,
                  right: 70,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppConfig.primarySwatch[200]!.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}