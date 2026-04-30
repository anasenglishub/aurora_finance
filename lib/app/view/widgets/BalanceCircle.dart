import 'package:flutter/material.dart';
import 'dart:math';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(home: Scaffold(backgroundColor: Color(0xFF0D1117), body: Center(child: BalanceCircle(balancePercent: 0.7, reservedPercent: 0.4, totalBalance: 10000)))));

class BalanceCircle extends StatelessWidget {
  final double balancePercent; // Value between 0.0 and 1.0
  final double reservedPercent; // Value between 0.0 and 1.0
  final double totalBalance; // Total balance

  const BalanceCircle({
    super.key,
    required this.balancePercent,
    required this.reservedPercent,
    required this.totalBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(300, 300),
          painter: CircleProgressPainter(
            balancePercent: balancePercent,
            reservedPercent: reservedPercent,
          ),
        ),
        // Central Text
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "\R\$${totalBalance.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: const Color(0xFF00E5FF),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: const Color(0xFF00E5FF).withValues(alpha: 0.5), blurRadius: 20)],
                    fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double balancePercent;
  final double reservedPercent;

  CircleProgressPainter({required this.balancePercent, required this.reservedPercent});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    const startAngle = -pi / 2; // Starting from the top (12 o'clock)

    // 1. Draw Background Track
    final trackPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(center, radius, trackPaint);

    // 2. Draw Liquid Balance Arc (Cyan)
    final balancePaint = Paint()
      ..color = AppConfig.primarySwatch[300] as Color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;
    
    // Add glow effect to balance
    balancePaint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * pi * balancePercent,
      false,
      balancePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}