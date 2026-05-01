import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/Card.dart';
import 'dart:ui';

class ActionButtons extends StatelessWidget {
  final List<Map<String, dynamic>> actionButtons;

  const ActionButtons({super.key, required this.actionButtons});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Row(
          spacing: 10,
          children: actionButtons.map((button) {
          return GestureDetector(
            onTap: () {},
            child: CardWidget(
              withBlurPattern: false,
              width: MediaQuery.of(context).size.width * 0.45,
              height: 120,
              child: Column(
                spacing: 4,
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
    );
  }
}