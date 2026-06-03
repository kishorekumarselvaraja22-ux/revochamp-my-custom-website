import 'package:flutter/material.dart';

class FeatureItem {
  final String title;
  final String description;
  final String icon;
  const FeatureItem(
      {required this.title, required this.description, required this.icon});
}

class FeaturesModel {
  final String sectionTitle;
  final String sectionSubtitle;
  final List<FeatureItem> items;
  const FeaturesModel(
      {required this.sectionTitle,
      required this.sectionSubtitle,
      required this.items});
}