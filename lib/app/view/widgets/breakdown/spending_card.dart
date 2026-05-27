import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/breakdown_card.dart';
import 'package:aurora_finance/app/model_view/transactions/transactions_model_view.dart';
import 'package:aurora_finance/app/entities/transaction.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionsModelView = TransactionsModelView();
    List<Transaction> expenseTransactions = [];

    expenseTransactions.addAll(transactionsModelView.expenseTransactions);

    final Map<String, double> temporaryTransactions = {};
    for (final transaction in expenseTransactions) {
      final category = transaction.category.name;
      final amount = transaction.amount;
      temporaryTransactions[category] =
          (temporaryTransactions[category] ?? 0) + amount;
    }

    List<Map<String, double>> groupTransactions = temporaryTransactions.entries
        .map((entry) {
          return {entry.key: double.parse(entry.value.toStringAsFixed(2))};
        })
        .toList();

    double totalSpending = groupTransactions.fold(
      0.0,
      (sum, transaction) => sum + transaction.values.first,
    );

    return ListenableBuilder(
      listenable: transactionsModelView,
      builder: (context, child) {
        return BreakdownCard(
          title: 'Spending by Category',
          icon: Icon(
            Icons.pie_chart_outline_rounded,
            color: Colors.orangeAccent,
          ),
          children: [
            ...groupTransactions.map(
              (transaction) => Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction.keys.first,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "R\$${transaction.values.first}",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: transaction.values.first / totalSpending,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppConfig.tertiarySwatch[300]!,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${(transaction.values.first / totalSpending * 100).toStringAsFixed(2)}%",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
