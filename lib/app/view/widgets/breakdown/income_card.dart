import 'package:aurora_finance/app/model_view/settings/available_fund_model_view.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/breakdown_card.dart';
import 'package:flutter/material.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AvailableFundModelView();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        final List<Map<String, double>> incomeItems = [
          { 'Contracted': viewModel.expectedIncome },
          { 'Extra': viewModel.extraIncome },
        ];

        return BreakdownCard(
          title: 'Income',
          icon: Icon(
            Icons.arrow_upward,
            color: AppConfig.primarySwatch,
          ),
          children: [
            ...incomeItems.map((item) {
              return Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.keys.first,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'R\$${item.values.first.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        );
      }
    );
  }
}