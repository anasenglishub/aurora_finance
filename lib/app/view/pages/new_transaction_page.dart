import 'package:aurora_finance/app/view/widgets/new_transaction_form_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/card_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class NewTransactionPage extends StatelessWidget {
  const NewTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConfig.backgroundColor,
        appBar: CustomAppBarWidget(
          title: 'New Transaction',
          icon: Icons.calendar_month,
          onTap: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardWidget(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  child: Column(
                    spacing: 16,
                    children: [
                      Text(
                        'Amount (R\$)'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        'R\$ 0,00',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),

                NewTransactionFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}