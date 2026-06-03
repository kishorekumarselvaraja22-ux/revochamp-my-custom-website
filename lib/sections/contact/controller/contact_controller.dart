import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/contact_model.dart';

class ContactController extends StateNotifier<ContactModel> {
  ContactController(super.model);
}