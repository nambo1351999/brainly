import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final FocusNode focusNode;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.orange,
      maxLines: 3,
      minLines: 1,
      keyboardType: TextInputType.text,
      controller: controller,
      enabled: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.orange),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Colors.orange)),
      ),
    );
  }
}
