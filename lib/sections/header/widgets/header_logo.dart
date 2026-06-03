import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/header_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_icons.dart';
import '../../../theme/app_typography.dart';

class HeaderLogo extends StatelessWidget {
  final HeaderModel header;

  const HeaderLogo({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    final logoIcon = AppIcons.getIconData(header.logoIcon);
    return Row(
      children: [
        Icon(logoIcon, color: AppColors.primary, size: 24),
        const SizedBox(width: 8),
        Text(
          header.logoText,
          style: GoogleFonts.getFont(
            AppTypography.headingFont,
            textStyle: const TextStyle(
              color: AppColors.text,
              fontSize: AppTypography.h2Size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}