import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/UI/CustomAppbarWidget.dart';
import 'package:aurora_finance/app/view/widgets/AvailableCardWidget.dart';
import 'package:aurora_finance/app/view/widgets/SetExpectedIncomeWidget.dart';
import 'package:aurora_finance/app/model_view/available_fund_model_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConfig.backgroundColor,
        appBar: CustomAppBarWidget(
          title: 'Home',
          icon: Icons.wallet,
          onTap: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListenableBuilder(  // ← Wrap content here
            listenable: AvailableFundModelView(),
            builder: (context, child) {
              final viewModel = AvailableFundModelView();
              
              return SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    AvailableCardWidget(),
                    if (viewModel.availableFund == 0)  // ← Now updates dynamically!
                      SetExpectedIncomeWidget(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}