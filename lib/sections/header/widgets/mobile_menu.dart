import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/header_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/app_button.dart';

class HeaderMobileMenu extends StatelessWidget {
  final HeaderModel header;

  const HeaderMobileMenu({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu_rounded, color: AppColors.text),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.background,
          builder: (context) => Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...header.links.map((link) => ListTile(
                      title: Text(
                        link,
                        style: GoogleFonts.getFont(
                          AppTypography.bodyFont,
                          textStyle: const TextStyle(color: AppColors.text),
                        ),
                      ),
                      onTap: () => Navigator.pop(context),
                    )),
                const SizedBox(height: 16),
                AppButton(
                  text: 'Close',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}