import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/UI/CardWidget.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aurora_finance/app/view/widgets/UI/CustomButtonWidget.dart';
import 'package:aurora_finance/app/model_view/settings/available_fund_model_view.dart';

class AvailableCardWidget extends StatelessWidget {
  AvailableCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AvailableFundModelView(), 
      builder: (context, child) {
        final viewModel = AvailableFundModelView();  

        return CardWidget(
          upperBorderColor: AppConfig.primarySwatch[700],
          crossAxisAlignment: CrossAxisAlignment.center,
          child: Column(
            spacing: 8,
            children: [
              Text(
                'Available to spend'.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppConfig.neutralSwatch[500],
                ),
              ),
      
              Text(
                "R\$${viewModel.availableFund.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppConfig.primarySwatch[700],
                  fontSize: 32,
                ),
              ),
      
              CustomButtonWidget(
                onPressed: () {},
                backgroundColor: AppConfig.primarySwatch[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      "View Breakdown".toUpperCase(),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: AppConfig.primarySwatch[700],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: AppConfig.primarySwatch[700]),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}