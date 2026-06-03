import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/header_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import 'header_action_button.dart';

class HeaderDesktopMenu extends StatelessWidget {
  final HeaderModel header;

  const HeaderDesktopMenu({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: header.links
              .map((link) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      link,
                      style: GoogleFonts.getFont(
                        AppTypography.bodyFont,
                        textStyle: const TextStyle(
                          color: AppColors.text,
                          fontSize: AppTypography.bodySize,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const HeaderActionButton(),
      ],
    );
  }
}