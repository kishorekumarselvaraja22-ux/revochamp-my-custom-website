import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_typography.dart';
import '../widgets/app_card.dart';
import '../widgets/app_button.dart';
import '../widgets/section_title.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import '../model/contact_model.dart';
import '../provider/contact_provider.dart';

class ContactSection extends ConsumerWidget {
  final bool isMobile;
  final bool isTablet;

  const ContactSection(
      {super.key, required this.isMobile, required this.isTablet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contact = ref.watch(contactProvider);
    final infoWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: contact.sectionTitle, isCentered: false),
        const SizedBox(height: 24),
        Text('Phone: ${contact.phone}',
            style: GoogleFonts.getFont(AppTypography.bodyFont,
                textStyle: TextStyle(
                    color: AppColors.text, fontSize: isMobile ? 14 : 16))),
        const SizedBox(height: 12),
        Text('Email: ${contact.email}',
            style: GoogleFonts.getFont(AppTypography.bodyFont,
                textStyle: TextStyle(
                    color: AppColors.text, fontSize: isMobile ? 14 : 16))),
        const SizedBox(height: 12),
        Text('Address: ${contact.address}',
            style: GoogleFonts.getFont(AppTypography.bodyFont,
                textStyle: TextStyle(
                    color: AppColors.text, fontSize: isMobile ? 14 : 16))),
      ],
    );
    final formWidget = contact.showForm
        ? AppCard(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              const TextField(
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white70))),
              const SizedBox(height: 16),
              const TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white70))),
              const SizedBox(height: 24),
              SizedBox(
                  width: double.infinity,
                  child: AppButton(text: 'Send Message', onPressed: () {})),
            ]),
          )
        : const SizedBox.shrink();
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSpacing.sectionPadding * 0.6
              : AppSpacing.sectionPadding,
          horizontal: isMobile ? 20 : 48),
      color: AppColors.background,
      child: (isMobile || isTablet)
          ? Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              infoWidget,
              if (contact.showForm) const SizedBox(height: 32),
              if (contact.showForm) formWidget
            ])
          : Row(children: [
              Expanded(child: infoWidget),
              if (contact.showForm) const SizedBox(width: 48),
              if (contact.showForm) Expanded(child: formWidget)
            ]),
    );
  }
}