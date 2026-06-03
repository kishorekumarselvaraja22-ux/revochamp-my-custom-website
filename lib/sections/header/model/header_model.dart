import 'package:flutter/material.dart';

class HeaderModel {
  final String logoText;
  final String logoIcon;
  final List<String> links;

  const HeaderModel(
      {required this.logoText, required this.logoIcon, required this.links});
}

// --- Controller ---