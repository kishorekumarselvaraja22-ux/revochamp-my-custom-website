import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/footer_model.dart';
import '../controller/footer_controller.dart';

final footerProvider =
    StateNotifierProvider<FooterController, FooterModel>((ref) {
  return FooterController(FooterModel(
    companyName: 'My Enterprise LLC',
    copyright: '© 2026 My Enterprise. All Rights Reserved.',
  ));
});