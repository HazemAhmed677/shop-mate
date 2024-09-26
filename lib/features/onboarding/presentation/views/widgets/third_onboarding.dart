import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/onboarding_header.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingHeader(
      image: AppImages.onboarding3,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Swift ',
                style: AppStyles.semiBoldPoppins28(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                'and ',
                style: AppStyles.semiBoldPoppins28(context),
              ),
              Text(
                'Reliable',
                style: AppStyles.semiBoldPoppins28(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          Text(
            'Delivery',
            style: AppStyles.semiBoldPoppins28(context),
          ),
        ],
      ),
    );
  }
}
