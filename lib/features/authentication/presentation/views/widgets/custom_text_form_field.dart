import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.obscure = false,
    this.suffixIcon,
  });
  final String hint;
  final bool obscure;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        hintFadeDuration: const Duration(milliseconds: 300),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(26.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(26.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
      ),
    );
  }
}
