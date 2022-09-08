import 'package:flutter/material.dart';

class TextFieldbuilder extends StatelessWidget {
  const TextFieldbuilder({
    required this.controller,
    required this.focus,
    Key? key,
  }) : super(key: key);
  final FocusNode focus;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: TextField(
        focusNode: focus,
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
