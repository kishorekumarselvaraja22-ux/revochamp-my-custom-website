import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_typography.dart';
import '../theme/app_theme.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import '../model/features_model.dart';
import '../provider/features_provider.dart';

class FeaturesSection extends ConsumerWidget {
  final bool isMobile;
  final bool isTablet;

  const FeaturesSection(
      {super.key, required this.isMobile, required this.isTablet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final features = ref.watch(featuresProvider);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSpacing.sectionPadding * 0.6
              : AppSpacing.sectionPadding,
          horizontal: isMobile ? 20 : 48),
      color: AppColors.background,
      child: Column(
        children: [
          SectionTitle(
            title: features.sectionTitle,
            subtitle: features.sectionSubtitle.isEmpty
                ? null
                : features.sectionSubtitle,
          ),
          SizedBox(height: isMobile ? 32 : 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: features.items.map((item) {
              final iconData = AppIcons.getIconData(item.icon);
              return SizedBox(
                width: isMobile ? double.infinity : (isTablet ? 320 : 280),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(iconData, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(item.title,
                          style: GoogleFonts.getFont(AppTypography.headingFont,
                              textStyle: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(height: 8),
                      Text(item.description,
                          style: GoogleFonts.getFont(AppTypography.bodyFont,
                              textStyle: TextStyle(
                                  color: AppColors.text.withValues(alpha: 0.5),
                                  fontSize: 13))),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}