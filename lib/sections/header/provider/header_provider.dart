import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/header_model.dart';
import '../controller/header_controller.dart';

final headerProvider =
    StateNotifierProvider<HeaderController, HeaderModel>((ref) {
  return HeaderController(HeaderModel(
    logoText: 'New Logo',
    logoIcon: 'settings_suggest_rounded',
    links: ["Hero Section", "Features Grid", "Contact Details & Form"],
  ));
});

// --- View ---