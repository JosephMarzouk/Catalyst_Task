import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomFormField({
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
