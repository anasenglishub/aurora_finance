import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/Card.dart';

class RecentPurchases extends StatelessWidget {
  const RecentPurchases({super.key});

  List<Map<String, dynamic>> get recentPurchases => [
    {'icon': Icons.shopping_cart, 'label': 'Shopping', 'amount': '\$50.00'},
    {'icon': Icons.food_bank, 'label': 'Groceries', 'amount': '\$30.00'},
    {'icon': Icons.local_gas_station, 'label': 'Gas', 'amount': '\$20.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      alignment: Alignment.topLeft,
      withBlurPattern: false,
      title: 'Recent Purchases',
      child: Column(
        children: [
          ...recentPurchases.map((purchase) => Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(purchase['icon']),
              ),
              Text(purchase['label']),
              Text(purchase['amount']),
            ],
          )),
        ],
      ),
    );
  }
}