import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/hero_model.dart';

class HeroController extends StateNotifier<HeroModel> {
  HeroController(super.model);
}

// --- Provider ---