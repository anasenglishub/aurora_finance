import 'package:aurora_finance/app/view/widgets/UI/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      appBar: CustomAppBarWidget(title: 'Settings', icon: Icons.settings),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}