import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_typography.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import '../model/footer_model.dart';
import '../provider/footer_provider.dart';

class FooterSection extends ConsumerWidget {
  final bool isMobile;
  final bool isTablet;

  const FooterSection(
      {super.key, required this.isMobile, required this.isTablet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final footer = ref.watch(footerProvider);
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 40, horizontal: isMobile ? 24 : 48),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
            top: BorderSide(color: AppColors.text.withValues(alpha: 0.08))),
      ),
      child: isMobile
          ? Column(children: [
              Text(footer.companyName,
                  style: GoogleFonts.getFont(AppTypography.headingFont,
                      textStyle: const TextStyle(
                          color: AppColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
              const SizedBox(height: 12),
              Text(footer.copyright,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(AppTypography.bodyFont,
                      textStyle: TextStyle(
                          color: AppColors.text.withValues(alpha: 0.4),
                          fontSize: 11))),
            ])
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(footer.companyName,
                  style: GoogleFonts.getFont(AppTypography.headingFont,
                      textStyle: const TextStyle(
                          color: AppColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
              Text(footer.copyright,
                  style: GoogleFonts.getFont(AppTypography.bodyFont,
                      textStyle: TextStyle(
                          color: AppColors.text.withValues(alpha: 0.4),
                          fontSize: 12))),
            ]),
    );
  }
}