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
      controller: controller,
      focusNode: focusNode,
    );
  }
}
