import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'dart:ui';

class CardWidget extends StatelessWidget {
  final bool withBlurPattern;
  final Color? blurColorLight;
  final Color? blurColorDark;
  final Widget child;
  final double? width;

  const CardWidget({super.key, required this.withBlurPattern, this.blurColorLight, this.blurColorDark, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.1),
        boxShadow: [
          BoxShadow(
            color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
          fit: StackFit.loose,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: child,
            ),
            if (withBlurPattern) ...[
              // Blur orb — top left
              Positioned(
                top: 0,
                left: -20,
                child: IgnorePointer(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blurColorLight?.withValues(alpha: 0.2) ?? Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              // Blur orb — bottom right
              Positioned(
                bottom: 0,
                right: -20,
                child: IgnorePointer(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blurColorDark?.withValues(alpha: 0.2) ?? Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
    );
  }
}