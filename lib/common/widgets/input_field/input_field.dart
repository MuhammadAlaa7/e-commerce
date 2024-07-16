import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  final bool obscureText;
  final String label;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: (value) {
        return;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
