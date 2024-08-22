import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/custom_dots.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/custom_next_prev_button.dart';
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
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SafeArea(
                bottom: false,
                right: false,
                left: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12,
                    top: 12,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouters.login);
                    },
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (currentIndex == 0)
                        ? const SizedBox()
                        : CustomNextPrevButton(
                            onPressed: () {
                              pageController.previousPage(
                                curve: Curves.easeInOut,
                                duration: const Duration(
                                  milliseconds: 350,
                                ),
                              );
                            },
                            backgroundColor: AppColors.white,
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.primaryColor,
                              size: 26,
                            ),
                          ),
                    CustomDots(
                      currentIndex: currentIndex,
                    ),
                    CustomNextPrevButton(
                      onPressed: () async {
                        if (currentIndex < 2) {
                          await pageController.nextPage(
                              curve: Curves.easeInOut,
                              duration: const Duration(
                                milliseconds: 400,
                              ));
                        } else {
                          GoRouter.of(context).push(AppRouters.login);
                        }
                      },
                      backgroundColor: AppColors.primaryColor,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 26,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
