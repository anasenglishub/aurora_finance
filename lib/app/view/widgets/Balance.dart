import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:aurora_finance/app/view/widgets/BalanceCircle.dart';
import 'package:google_fonts/google_fonts.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.1),
        boxShadow: [
          BoxShadow(
            color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 30,
        children: [
          Text("LIQUID BALANCE", style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontFamily: GoogleFonts.spaceGrotesk().fontFamily)),
          BalanceCircle(balancePercent: 0.7, reservedPercent: 0.4, totalBalance: 4250),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppConfig.neutralColor!.withValues(alpha: 0.1),
              border: Border.all(
                color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: [
                  Icon(Icons.shield, color: AppConfig.secondarySwatch[300]),
                  Text(
                    'RESERVES',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
                      color: AppConfig.primarySwatch[50]!.withValues(alpha: 0.3),
                    ),
                  ),
                ]),
                Text(
                  'R\$ 2.750',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
                    color: AppConfig.primarySwatch[50]!,
                  ),
                ),
    
              ],
            ),
          ),
        ],
      ),
    );
  }
}