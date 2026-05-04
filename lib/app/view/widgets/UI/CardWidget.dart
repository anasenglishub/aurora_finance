import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final Color? upperBorderColor;
  final Color? backgroundColor;

  const CardWidget({super.key, required this.child, this.borderColor, this.upperBorderColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? AppConfig.neutralSwatch[100]!),
        boxShadow: [
          BoxShadow(
            color: AppConfig.neutralSwatch[300]!.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 3,
            color: upperBorderColor ?? Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }
}