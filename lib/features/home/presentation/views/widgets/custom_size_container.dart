import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomSizeContainer extends StatelessWidget {
  const CustomSizeContainer({
    super.key,
    required this.isActive,
    required this.size,
  });
  final bool isActive;
  final String size;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 150,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: (isActive) ? AppColors.primaryColor : AppColors.white,
        border: Border.all(
          color: (isActive) ? AppColors.primaryColor : const Color(0xffE6E6E6),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Text(
          size,
          style: AppStyles.regular24(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 14),
            color: (isActive) ? AppColors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
