import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  
  const CustomAppBarWidget({super.key, required this.title, required this.icon, this.onTap});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
          ),
          child: Row(
            children: [
              if (ModalRoute.of(context)?.isFirst == false) ...[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: AppConfig.primarySwatch),
                  onPressed: () => Navigator.pop(context),
                ),
              ] else ... [
                Icon(Icons.wallet, color: AppConfig.primarySwatch),
              ],
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontFamily: GoogleFonts.manrope().fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: onTap,
                child: Icon(icon, color: AppConfig.primarySwatch),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 