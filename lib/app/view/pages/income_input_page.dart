import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_app_bar_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/card_widget.dart';
import 'package:aurora_finance/app/view/widgets/income_input_widget.dart';

class IncomeInputPage extends StatelessWidget {
  const IncomeInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: 'Income Input',
          icon: Icons.more_vert,
          onTap: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Montlhy Projection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Log contracted retainers and expected extra income for accurate cash flow forecasting.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CardWidget(
                      child: IncomeInputForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}