import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/onboarding_header.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingHeader(
      image: AppImages.onboarding2,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Whishlist: ',
                style: AppStyles.semiBoldPoppins28,
              ),
              Text(
                'Where ',
                style: AppStyles.semiBoldPoppins28,
              ),
              Text(
                'Fashion',
                style: AppStyles.semiBoldPoppins28.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dreams ',
                style: AppStyles.semiBoldPoppins28,
              ),
              Text(
                'Begin',
                style: AppStyles.semiBoldPoppins28.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
