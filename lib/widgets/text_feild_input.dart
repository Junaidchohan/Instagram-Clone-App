import 'package:flutter/material.dart';

class TextFeildInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFeildInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        border: inputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
