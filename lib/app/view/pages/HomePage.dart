import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aurora_finance/app/view/widgets/CustomAppbarWidget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConfig.backgroundColor,
        appBar: CustomAppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}