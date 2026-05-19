import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/UI/custom_button_widget.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/breakdown_card.dart';
import 'package:aurora_finance/app/view/widgets/breakdown/fixed_bill_item.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/model_view/settings/fixed_bills_model_view.dart';

class FixedBillsCard extends StatelessWidget {
  const FixedBillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final modelView = FixedBillsModelView();

    return ListenableBuilder(
      listenable: modelView,
      builder: (context, child) {
        final fixedBills = modelView.fixedBills;

        return BreakdownCard(
          title: 'Fixed Bills',
          icon: Icon(  
            Icons.document_scanner_rounded,
            color: Colors.red[600],
          ),
          children: [
            if (fixedBills.isNotEmpty)
            ...fixedBills.map((bill) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        FixedBillItem(bill: bill, fixedBillsModelView: modelView),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,)
                ],
              );
            }),

            if (fixedBills.isEmpty)
              CustomButtonWidget(
                backgroundColor: AppConfig.primarySwatch[600],
                child: Text('Set fixed bills'), 
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                }
              )
          ],
        );
      },
    );
  }
}