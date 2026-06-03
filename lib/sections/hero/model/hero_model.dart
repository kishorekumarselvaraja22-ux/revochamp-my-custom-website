import 'package:flutter/material.dart';

class HeroModel {
  final String title;
  final String subtitle;
  final String description;
  final String primaryButtonText;
  final String secondaryButtonText;
  final String imageUrl;
  final bool isCentered;

  const HeroModel(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.primaryButtonText,
      required this.secondaryButtonText,
      required this.imageUrl,
      required this.isCentered});
}

// --- Controller ---