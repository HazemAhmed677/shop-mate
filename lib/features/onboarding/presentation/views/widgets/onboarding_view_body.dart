import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/custom_page_view.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/onboarding_header.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SafeArea(
          bottom: false,
          right: false,
          left: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                overlayColor: AppColors.primaryColor,
              ),
              onPressed: () {},
              child: Text(
                'Skip',
                style: AppStyles.regular24.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const CustomPageView(),
      ],
    );
  }
}
