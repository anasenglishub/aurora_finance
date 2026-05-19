import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/UI/card_widget.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class BreakdownCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final List<Widget> children;

  const BreakdownCard({super.key, required this.title, required this.icon, required this.children});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppConfig.neutralSwatch[500],
                ),
              ),
            ],
          ),
          Divider(color: AppConfig.neutralSwatch[100]), 
          ...children,
        ],
      ),
    );
  }
}