import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomSearchTextFeild extends StatelessWidget {
  const CustomSearchTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
        hintFadeDuration: const Duration(
          milliseconds: 200,
        ),
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: AppColors.primaryColor,
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        enabledBorder: buildBorder(
          color: Colors.grey.shade400,
        ),
        focusedBorder: buildBorder(
          color: Colors.grey.shade400,
        ),
        errorBorder: buildBorder(
          color: Colors.redAccent.shade100,
        ),
        focusedErrorBorder: buildBorder(
          color: Colors.redAccent.shade100,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({
    required Color color,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(26.0),
    );
  }
}
