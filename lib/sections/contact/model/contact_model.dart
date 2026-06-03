import 'package:flutter/material.dart';

class ContactModel {
  final String sectionTitle;
  final String email;
  final String phone;
  final String address;
  final bool showForm;
  const ContactModel(
      {required this.sectionTitle,
      required this.email,
      required this.phone,
      required this.address,
      required this.showForm});
}