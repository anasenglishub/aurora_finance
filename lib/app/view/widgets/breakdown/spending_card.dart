import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/breakdown_card.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakdownCard(
      title: 'Spending by Category',
      icon: Icon(
        Icons.pie_chart_outline_rounded,
        color: Colors.orangeAccent,
      ),
      children: [],
    );
  }
}