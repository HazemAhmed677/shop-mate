import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class CustomWelcomText extends StatelessWidget {
  const CustomWelcomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The ',
                  style: AppStyles.semiBoldPoppins28(context).copyWith(
                    fontSize: getResponsiveText(context: context, base: 26),
                  ),
                ),
                Text(
                  'ShopMate App ',
                  style: AppStyles.semiBoldPoppins28(context).copyWith(
                    color: AppColors.primaryColor,
                    fontSize: getResponsiveText(context: context, base: 26),
                  ),
                ),
                Text(
                  'That',
                  style: AppStyles.semiBoldPoppins28(context).copyWith(
                    fontSize: getResponsiveText(context: context, base: 26),
                  ),
                )
              ],
            ),
            Text(
              'Makes You Look Your Best',
              style: AppStyles.semiBoldPoppins28(context).copyWith(
                fontSize: getResponsiveText(context: context, base: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
