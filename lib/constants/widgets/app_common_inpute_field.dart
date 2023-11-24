import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CommonTextField(
      {super.key,
      this.controller,
      this.focusNode,
      required this.hintText,
      this.labelText,
      this.prefixIcon,
      this.prefixIconColor,
      this.suffixIcon,
      this.suffixIconColor,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.red),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
      ),
    );
  }
}
