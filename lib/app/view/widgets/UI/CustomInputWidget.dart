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

  const CustomInputWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.onTextChanged,
    this.suffixIcon,
    this.readOnly = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppConfig.neutralSwatch[200]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onTextChanged,
              readOnly: readOnly,
              keyboardType: keyboardType,
              style: TextStyle(
                color: AppConfig.neutralSwatch[500],
                fontFamily: AppConfig.bodyFont,
              ),
              decoration: InputDecoration(
                hintText: hintText ?? labelText,
                hintStyle: TextStyle(
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
    );
  }
}