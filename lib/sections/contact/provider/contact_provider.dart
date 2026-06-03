import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/contact_model.dart';
import '../controller/contact_controller.dart';

final contactProvider =
    StateNotifierProvider<ContactController, ContactModel>((ref) {
  return ContactController(ContactModel(
    sectionTitle: 'Connect with Our Team',
    email: 'support@enterprise.com',
    phone: '+1 (555) 123-4567',
    address: '100 Silicon Blvd, Suite 200, San Jose, CA',
    showForm: false,
  ));
});