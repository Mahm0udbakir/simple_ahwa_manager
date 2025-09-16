import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int minLines;
  final int maxLines;
  final String? Function(String?)? validator;

  const LabeledTextField({
    super.key,
    required this.controller,
    required this.label,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
    );
  }
}


