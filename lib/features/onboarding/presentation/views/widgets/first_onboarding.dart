import 'package:flutter/material.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/onboarding_header.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingHeader(
      image: AppImages.onboarding1,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seamless ',
                style: AppStyles.semiBoldPoppins28.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                'Shopping',
                style: AppStyles.semiBoldPoppins28,
              ),
            ],
          ),
          Text(
            'Experience',
            style: AppStyles.semiBoldPoppins28,
          ),
        ],
      ),
    );
  }
}
