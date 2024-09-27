import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/widgets/custom_action_button.dart';
import 'package:shop_mate/core/widgets/lorem_text.dart';
import 'already_have_an_account.dart';
import 'custom_welcom_text.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.welcome,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 22.0,
                ),
                child: CustomWelcomText(),
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              const LoremText(),
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: CustomActionButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouters.onBoarding);
                  },
                  text: r"Let's Get Started",
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22.0,
                ),
                child: AlreadyHaveAnAccount(
                  onTap: () {
                    context.go(
                      AppRouters.signIn,
                    );
                  },
                ),
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
