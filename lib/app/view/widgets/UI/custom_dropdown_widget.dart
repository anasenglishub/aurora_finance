import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class CustomDropdownWidget extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final String initialValue;
  final List<String> items;
  final String label;

  const CustomDropdownWidget({
    super.key,
    required this.onChanged,
    required this.initialValue,
    required this.items,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: Colors.white,
          child: DropdownButtonFormField<String>(
            initialValue: initialValue,
            icon: Icon(Icons.keyboard_arrow_down),
            dropdownColor: AppConfig.backgroundColor,
            isDense: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppConfig.neutralSwatch[200]!),
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}