import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/custom_dots.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/custom_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
  }

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
        CustomPageView(
          pageController: pageController,
        ),
        const Expanded(
          child: SizedBox(
            height: 22,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomDots(
              currentIndex: currentIndex,
            ),
          ],
        ),
        const SizedBox(
          height: 38,
        ),
      ],
    );
  }
}
