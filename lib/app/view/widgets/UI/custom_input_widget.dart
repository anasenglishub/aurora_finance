import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class CustomInputWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onTextChanged;
  final Widget? suffixIcon;  // For the calendar icon or other icons
  final bool readOnly;
  final TextInputType? keyboardType;
  final Border? border;
  final TextAlign? textAlign;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomInputWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.onTextChanged,
    this.suffixIcon,
    this.readOnly = false,
    this.keyboardType,
    this.border,
    this.textAlign = TextAlign.left,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: border ?? Border.all(color: AppConfig.neutralSwatch[200]!),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onTextChanged,
                  readOnly: readOnly,
                  keyboardType: keyboardType,
                  style: textStyle ?? TextStyle(
                    color: AppConfig.neutralSwatch[500],
                    fontFamily: AppConfig.bodyFont, 
                  ),
                  textAlign: textAlign ?? TextAlign.left,
                  decoration: InputDecoration(
                    hintText: hintText ?? labelText,
                    hintStyle: hintStyle ?? TextStyle(
                      color: AppConfig.neutralSwatch[300],
                      fontFamily: AppConfig.bodyFont,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              if (suffixIcon != null)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: suffixIcon,
                ),
            ],
          ),
        ),
      ],
    );
  }
}