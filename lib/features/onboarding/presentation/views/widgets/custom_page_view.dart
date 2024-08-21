import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/first_onboarding.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/onboarding_header.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/second_onboarding.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/third_onboarding.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
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
