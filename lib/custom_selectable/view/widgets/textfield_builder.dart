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
    return Container(
      constraints: BoxConstraints(
        minWidth: 100,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: TextField(
        focusNode: focus,
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
