import 'package:aurora_finance/app/view/widgets/forms/new_transaction_form_widget.dart';
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
        body: Column(
          children: [
            Expanded(child: NewTransactionFormWidget()),
          ],
        ),
      ),
    );
  }
}