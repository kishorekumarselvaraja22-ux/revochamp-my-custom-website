import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_typography.dart';
import '../theme/app_theme.dart';
import '../widgets/app_button.dart';
import '../widgets/section_title.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import '../model/hero_model.dart';
import '../provider/hero_provider.dart';

class HeroSection extends ConsumerWidget {
  final bool isMobile;
  final bool isTablet;

  const HeroSection(
      {super.key, required this.isMobile, required this.isTablet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hero = ref.watch(heroProvider);
    final forceStack = isMobile || isTablet;
    final centered = hero.isCentered || forceStack;

    final contentWidget = Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: hero.title,
          subtitle: hero.subtitle.isEmpty ? null : hero.subtitle,
          isCentered: centered,
        ),
        const SizedBox(height: 16),
        Text(
          hero.description,
          textAlign: centered ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.getFont(AppTypography.bodyFont,
              textStyle: TextStyle(
                  color: AppColors.text.withValues(alpha: 0.6),
                  fontSize: isMobile
                      ? AppTypography.bodySize - 1
                      : AppTypography.bodySize,
                  height: 1.5)),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            AppButton(text: hero.primaryButtonText, onPressed: () {}),
            if (hero.secondaryButtonText.isNotEmpty)
              AppButton(
                  text: hero.secondaryButtonText,
                  isPrimary: false,
                  onPressed: () {}),
          ],
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSpacing.sectionPadding * 0.6
              : AppSpacing.sectionPadding,
          horizontal: isMobile ? 20 : 48),
      color: AppColors.background,
      child: forceStack
          ? Column(children: [
              contentWidget,
              if (hero.imageUrl.isNotEmpty) const SizedBox(height: 32),
              if (hero.imageUrl.isNotEmpty)
                ClipRRect(
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                    child: Image.network(hero.imageUrl,
                        height: isMobile ? 220 : 320,
                        width: double.infinity,
                        fit: BoxFit.cover))
            ])
          : Row(children: [
              Expanded(flex: 6, child: contentWidget),
              if (hero.imageUrl.isNotEmpty) const SizedBox(width: 32),
              if (hero.imageUrl.isNotEmpty)
                Expanded(
                    flex: 5,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppTheme.cardRadius),
                        child: Image.network(hero.imageUrl,
                            height: 320, fit: BoxFit.cover)))
            ]),
    );
  }
}