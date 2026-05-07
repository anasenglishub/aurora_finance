import 'package:aurora_finance/app/view/widgets/UI/CardWidget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/UI/CustomAppbarWidget.dart';
import 'package:aurora_finance/app/view/widgets/AvailableCardWidget.dart';
import 'package:aurora_finance/app/view/widgets/SetExpectedIncomeWidget.dart';
import 'package:aurora_finance/app/view/widgets/IndicatorsWidget.dart';
import 'package:aurora_finance/app/view/widgets/UI/BottomNavigationBarWidget.dart';

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
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                CardWidget(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  child: Text(
                    'Month',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppConfig.primarySwatch[700],
                    ),
                  ),
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
            // Add your action here
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}