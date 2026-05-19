import 'package:aurora_finance/app/view/widgets/breakdown/breakdown_card.dart';
import 'package:flutter/material.dart';

class CCreserveCard extends StatelessWidget {
  const CCreserveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakdownCard(
      title: 'CC Reserve',
      icon: Icon(
        Icons.eco,
        color: Colors.lightGreen,
      ),
      children: [],
    );
  }
}