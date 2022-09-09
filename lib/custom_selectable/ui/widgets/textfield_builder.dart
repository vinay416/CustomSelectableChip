import 'package:flutter/material.dart';

class TextFieldbuilder extends StatelessWidget {
  const TextFieldbuilder({
    required this.controller,
    required this.focus,
    required this.isEmpty,
    this.hintText,
    Key? key,
  }) : super(key: key);
  final FocusNode focus;
  final TextEditingController controller;
  final String? hintText;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: TextField(
        focusNode: focus,
        controller: controller,
        decoration: InputDecoration(
          hintText: isEmpty ? hintText : "",
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
