import 'package:aurora_finance/app/view/widgets/UI/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_app_bar_widget.dart';
import 'package:aurora_finance/app/view/widgets/available_card_widget.dart';
import 'package:aurora_finance/app/view/widgets/set_expected_income_widget.dart';
import 'package:aurora_finance/app/view/widgets/indicators_widget.dart';
import 'package:aurora_finance/app/view/widgets/UI/bottom_navigation_bar.dart';
import 'package:aurora_finance/app/model_view/settings/available_fund_model_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      appBar: CustomAppBarWidget(
        title: 'Home',
        icon: Icons.wallet,
        onTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              ListenableBuilder(
                listenable: AvailableFundModelView(),
                builder: (context, child) {
                  return CardWidget(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    child: Text(
                      AvailableFundModelView().currentMonth,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppConfig.primarySwatch[700],
                      ),
                    ),
                );
                }
              ),
              AvailableCardWidget(),
              SetExpectedIncomeWidget(),
              IndicatorsWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppConfig.primarySwatch[500],
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/new-transaction');
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}