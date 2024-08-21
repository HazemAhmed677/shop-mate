import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/custom_action_button.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            '\t\t\t\t\t\t\tLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
            style: AppStyles.semiBoldInter16.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: CustomElevatedButton(
            onPressed: () {},
            text: r"Let's Get Started",
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: AlreadyHaveAnAccount(),
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
