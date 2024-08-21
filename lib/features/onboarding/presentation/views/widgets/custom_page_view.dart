import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/first_onboarding.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/second_onboarding.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/third_onboarding.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      itemCount: 3,
      controller: pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const FirstOnBoarding();
        } else if (index == 1) {
          return const SecondOnboarding();
        } else {
          return const ThirdOnboarding();
        }
      },
    );
  }
}
