import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/pages/HomePage.dart';

class AuroraApp extends StatelessWidget {
  const AuroraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const HomePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConfig.primarySwatch[500]!),
        scaffoldBackgroundColor: ColorScheme.fromSeed(seedColor: AppConfig.neutralColor).surface,
        fontFamily: AppConfig.bodyFont,
      ),
      title: 'Aurora Finance',
      home: const HomePage(),
    );
  }
}