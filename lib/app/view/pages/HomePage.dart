import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/Balance.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConfig.neutralColor,
        appBar: AppBar(
          title: Text('Aurora Finance'),
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
            children: [
              Stack(
                children: [
                  // Blurred blue ball — top left
                  Positioned(
                    top: -30,
                    left: -20,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppConfig.primarySwatch[300]!.withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                  ),
                  // Blurred blue ball — bottom right
                  Positioned(
                    bottom: -30,
                    right: -20,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppConfig.primarySwatch[500]!.withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                  ),
                  Balance(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}