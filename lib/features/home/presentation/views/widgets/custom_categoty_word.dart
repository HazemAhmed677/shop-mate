import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomCategoryWord extends StatelessWidget {
  const CustomCategoryWord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Category',
          style: AppStyles.regular24(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 22),
          ),
        ),
        Text(
          'See All',
          style: AppStyles.semiBoldInter16(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 18),
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
