import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class SignInWord extends StatelessWidget {
  const SignInWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        Text(
          'Sign In',
          style: AppStyles.regular24,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          r"Hi! Welcome Back, you've been missed",
          style: AppStyles.semiBoldPoppins28.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 52,
        ),
      ],
    );
  }
}
