import 'package:aurora_finance/app/model_view/transactions/transactions_model_view.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_button_widget.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/breakdown_card.dart';
import 'package:flutter/material.dart';

class CCreserveCard extends StatelessWidget {
  const CCreserveCard({super.key});

  @override
  Widget build(BuildContext context) {
    final modelView = TransactionsModelView();

    List<Map<String, double>> ccReserveBreakdown = [
      { 'Target': 1200.00 },
      { 'Saved': modelView.ccReserve }
    ];

    double remaining = ccReserveBreakdown.first['Target']! - ccReserveBreakdown.last['Saved']!;
    double percentage = remaining / ccReserveBreakdown.first['Target']!;

    return ListenableBuilder(
      listenable: modelView,
      builder: (context, child) {
        return BreakdownCard(
          title: 'CC Reserve',
          icon: Icon(
            Icons.eco,
            color: Colors.lightGreen,
          ),
          children: [
            ...ccReserveBreakdown.map((item) {
              return Column(
                children: [
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.keys.first),
                      Text(item.values.first.toString()),
                    ],
                  ),
                ],
              );
            }),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Remaining'),
                Text(remaining.toString()),
              ],
            ),

            SizedBox(height: 16),

            LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(AppConfig.primarySwatch),
              borderRadius: BorderRadius.circular(4),
              minHeight: 8,
            ),

            SizedBox(height: 16),

            CustomButtonWidget(
              width: double.infinity,
              backgroundColor: AppConfig.primarySwatch[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Text('Add CC Reserve'),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/new-transaction');
              },
            ),
          ],
        );
      },
    );
  }
}