import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class CustomButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double? width;
  final Color? backgroundColor;

  const CustomButtonWidget({
    super.key,
    required this.child,
    this.onPressed,
    this.width,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor ?? AppConfig.primarySwatch[50]!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.4,
        child: child,
      ),
    );
  }
}