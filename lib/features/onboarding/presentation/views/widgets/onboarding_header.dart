import 'package:flutter/material.dart';

import 'package:shop_mate/features/onboarding/presentation/views/widgets/lorem_text.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key, required this.image, required this.title});

  final String image;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(
          height: 28,
        ),
        title,
        const SizedBox(
          height: 22,
        ),
        const LoremText(),
      ],
    );
  }
}
