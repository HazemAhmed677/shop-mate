import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/widgets/custom_action_button.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/lorem_text.dart';

import 'already_have_an_account.dart';
import 'custom_welcom_text.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 22,
        ),
        Image.asset(
          AppImages.welcome,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: CustomWelcomText(),
        ),
        const Expanded(
          child: SizedBox(
            height: 24,
          ),
        ),
        const LoremText(),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: CustomActionButton(
            onPressed: () async {
              await GoRouter.of(context).push(AppRouters.onBoarding);
            },
            text: r"Let's Get Started",
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: AlreadyHaveAnAccount(
            onTap: () {
              GoRouter.of(context).push(
                AppRouters.login,
              );
            },
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(
            height: 24,
          ),
        ),
      ],
    );
  }
}
