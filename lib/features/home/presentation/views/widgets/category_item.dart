import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

import '../../../../../core/helpers/captalize_the_first_letter.dart';
import '../../../../../core/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isActive,
    required this.category,
  });
  final bool isActive;
  final String category;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            32,
          ),
          color: (isActive) ? AppColors.primaryColor : AppColors.white,
          border: Border.all(
            color:
                (isActive) ? AppColors.primaryColor : const Color(0xffE6E6E6),
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Text(
          capitalizeFirstLetter(
            category,
          ),
          style: AppStyles.regular24.copyWith(
            fontSize: 16,
            color: (isActive) ? AppColors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
