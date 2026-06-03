import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_typography.dart';
import '../widgets/app_button.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import '../model/header_model.dart';
import '../provider/header_provider.dart';
import '../widgets/header_logo.dart';
import '../widgets/desktop_menu.dart';
import '../widgets/mobile_menu.dart';
import '../widgets/header_action_button.dart';

class HeaderSection extends ConsumerWidget {
  final bool isMobile;
  final bool isTablet;

  const HeaderSection(
      {super.key, required this.isMobile, required this.isTablet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final header = ref.watch(headerProvider);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 18, horizontal: isMobile ? 20 : (isTablet ? 24 : 32)),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
            bottom: BorderSide(color: AppColors.text.withValues(alpha: 0.08))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(header: header),
          if (isMobile)
            HeaderMobileMenu(header: header)
          else
            HeaderDesktopMenu(header: header),
        ],
      ),
    );
  }
}