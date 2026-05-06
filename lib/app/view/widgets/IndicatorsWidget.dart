import 'package:flutter/material.dart';
import 'package:aurora_finance/app/view/widgets/UI/CardWidget.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cashFlowIndicators = [
      {
        'title': 'Income',
        'value': 'R\$ 7.000,00',
        'color': Colors.green[700]
      },
      {
        'title': 'Expenses',
        'value': 'R\$ 3.500,00',
        'color': Colors.red[700],
      },
      {
        'title': 'Variable',
        'value': 'R\$ 380,00',
        'color': Colors.orange[700],
      }
    ];


    return Column(
      spacing: 20,
      children: [
        CardWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CC Reserve",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "R\$0.00",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(AppConfig.tertiarySwatch[300]!),
                borderRadius: BorderRadius.circular(4),
                minHeight: 8,
              ),
              const SizedBox(height: 8),
              Text(
                "50% reserved",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...cashFlowIndicators.map((indicator) {
              return CardWidget(
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      indicator['title'] as String,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      indicator['value'] as String,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: indicator['color'] as Color?,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        )
      ],
    );
  }
}