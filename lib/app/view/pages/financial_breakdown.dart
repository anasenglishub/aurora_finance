import 'package:aurora_finance/app/view/widgets/UI/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/income_card.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/fixed_bills_card.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/CCreserve_card.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/spending_card.dart';

class FinancialBreakdownPage extends StatelessWidget {
  const FinancialBreakdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      appBar: CustomAppBarWidget(
        title: 'Financial Breakdown',
        icon: Icons.calendar_month,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              spacing: 16,
              children: [
                IncomeCard(),
                FixedBillsCard(),
                CCreserveCard(),
                SpendingCard(),
              ],
            );
          },
        ),
      ),
    );
  }
}
