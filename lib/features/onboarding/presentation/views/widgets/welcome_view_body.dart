import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';

import 'custom_welcom_text.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 26,
        ),
        Image.asset(
          AppImages.welcome,
        ),
        const CustomWelcomText(),
        const SizedBox(
          height: 18,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
