import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class CategoryItemLoading extends StatelessWidget {
  const CategoryItemLoading({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          32,
        ),
        color: AppColors.white,
        border: Border.all(
          color: const Color(0xffE6E6E6),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Text(
          'Audio',
          style: AppStyles.regular24(context).copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
