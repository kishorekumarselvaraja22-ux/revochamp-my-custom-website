import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/features_model.dart';
import '../controller/features_controller.dart';

final featuresProvider =
    StateNotifierProvider<FeaturesController, FeaturesModel>((ref) {
  final itemsData = [
    {
      "title": "Feature Core One",
      "description": "Description highlighting the primary value parameter.",
      "icon": "star_rounded"
    },
    {
      "title": "Feature Core Two",
      "description": "Description highlighting the secondary value parameter.",
      "icon": "trending_up_rounded"
    },
    {
      "title": "Feature Core Three",
      "description": "Description highlighting the tertiary value parameter.",
      "icon": "cloud_queue_rounded"
    }
  ];
  final items = itemsData
      .map<FeatureItem>((item) => FeatureItem(
            title: item['title'] ?? 'Title',
            description: item['description'] ?? 'Desc',
            icon: item['icon'] ?? 'star_rounded',
          ))
      .toList();
  return FeaturesController(FeaturesModel(
    sectionTitle: 'Key Features Outline',
    sectionSubtitle: 'Discover how our tools empower operational speed.',
    items: items,
  ));
});