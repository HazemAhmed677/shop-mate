import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/app_styles.dart';

class LogoWithName extends StatefulWidget {
  const LogoWithName({super.key});

  @override
  State<LogoWithName> createState() => _LogoWithNameState();
}

class _LogoWithNameState extends State<LogoWithName>
    with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation<double> fadeAnimation;
  late Animation<Offset> sliderAnimation;

  @override
  void initState() {
    super.initState();
    // For single resposiblity principle
    initialzeAnimationTools();

    navigateToObBoarding();
  }

  @override
  void dispose() {
    super.dispose();
    animationController1.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 24,
          child: AnimatedBuilder(
            animation: sliderAnimation,
            builder: (BuildContext context, Widget? child) => SlideTransition(
              position: sliderAnimation,
              child: Text(
                'S',
                style: AppStyles.semiBold24.copyWith(
                  color: AppColors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        AnimatedBuilder(
          animation: fadeAnimation,
          builder: (BuildContext context, Widget? child) => FadeTransition(
            opacity: fadeAnimation,
            child: Text(
              'ShopMate',
              style: AppStyles.semiBold24,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: sliderAnimation,
          builder: (BuildContext context, Widget? child) => SlideTransition(
            position: sliderAnimation,
            child: Text(
              '.',
              style: AppStyles.semiBold24.copyWith(
                fontSize: 32,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void initialzeAnimationTools() {
    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ),
    );
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController1);
    sliderAnimation = Tween<Offset>(
      begin: const Offset(0, 8),
      end: const Offset(0, 0),
    ).animate(animationController2);
    animationController1.forward();

    animationController2.fling();
  }

  void navigateToObBoarding() {
    Future.delayed(
      const Duration(milliseconds: 1800),
      () {
        GoRouter.of(context).go(AppRouters.welcome);
      },
    );
  }
}
