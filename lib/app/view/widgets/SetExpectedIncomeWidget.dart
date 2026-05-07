import 'package:aurora_finance/app/view/widgets/UI/CustomButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/UI/CardWidget.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/model_view/settings/available_fund_model_view.dart';

class SetExpectedIncomeWidget extends StatelessWidget {
  const SetExpectedIncomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AvailableFundModelView(), 
      builder: (context, child) {
        if (AvailableFundModelView().availableFund != 0) {
          return SizedBox.shrink();
        }
        return CardWidget(
          backgroundColor: AppConfig.primarySwatch[50]!,
          borderColor: AppConfig.primarySwatch[100]!,
          child: Column(
            children: [
              Text('It looks like you haven\'t set your expected income yet for this month yet.'),
              CustomButtonWidget(
                backgroundColor: AppConfig.primarySwatch[700]!,
                width: MediaQuery.of(context).size.width * 0.8,
                onPressed: () {
                  Navigator.pushNamed(context, '/income-input');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.credit_score_rounded),
                    SizedBox(width: 8),
                    Text('Set Expected Income'.toUpperCase()),
                  ],
                )
              )
            ],
          ),
        );
      }
    );
  }
}