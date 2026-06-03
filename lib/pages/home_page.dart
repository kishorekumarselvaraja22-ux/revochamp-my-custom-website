import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/responsive.dart';
import '../sections/header/view/header_section.dart';
import '../sections/hero/view/hero_section.dart';
import '../sections/features/view/features_section.dart';
import '../sections/contact/view/contact_section.dart';
import '../sections/footer/view/footer_section.dart';

class BuiltWebsiteHomePage extends StatelessWidget {
  const BuiltWebsiteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderSection(isMobile: isMobile, isTablet: isTablet),
            HeroSection(isMobile: isMobile, isTablet: isTablet),
            FeaturesSection(isMobile: isMobile, isTablet: isTablet),
            ContactSection(isMobile: isMobile, isTablet: isTablet),
            FooterSection(isMobile: isMobile, isTablet: isTablet),
          ],
        ),
      ),
    );
  }
}