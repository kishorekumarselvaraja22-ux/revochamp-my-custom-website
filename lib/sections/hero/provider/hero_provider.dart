import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/hero_model.dart';
import '../controller/hero_controller.dart';

final heroProvider = StateNotifierProvider<HeroController, HeroModel>((ref) {
  return HeroController(HeroModel(
    title: 'Inspiring Hero Heading Title',
    subtitle: 'An elegant supporting catchphrase',
    description:
        'Write a compelling description that outlines your main product features or brand values to engage customers.',
    primaryButtonText: 'Get Started',
    secondaryButtonText: 'Learn More',
    imageUrl:
        'https://images.unsplash.com/photo-1551434678-e076c223a692?q=80&w=600',
    isCentered: false,
  ));
});

// --- View ---