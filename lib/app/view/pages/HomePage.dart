import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/BalanceCircle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConfig.neutralColor,
        appBar: AppBar(
          title: Text('Aurora Finance'),
          centerTitle: true,
          backgroundColor: AppConfig.neutralColor,
          titleTextStyle: TextStyle(
            color: AppConfig.primarySwatch[300],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Home'),
              BalanceCircle(balancePercent: 0.7, reservedPercent: 0.4, totalBalance: 4250),
              
            ],
          ),
        ),
      ),
    );
  }
}