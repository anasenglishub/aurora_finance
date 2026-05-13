import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class CustomButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final Color? backgroundColor;
  final bool isDisabled;

  const CustomButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.backgroundColor,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.5,
      child: FilledButton(
        onPressed: isDisabled ? null : onPressed, 
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? AppConfig.primarySwatch[50]!,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBackgroundColor: Colors.grey[300],
        ),
        child: SizedBox(
          child: Center(child: child),
        ),
      ),
    );
  }
}