import 'package:flutter/material.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_word.dart';

import '../../../../../core/utils/app_styles.dart';

class SignUpTopSection extends StatelessWidget {
  const SignUpTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignWord(
          title: 'Create Acount',
          subTitle: 'Fill your information below or register',
          height: 12,
        ),
        Text(
          'with your social account.',
          style: AppStyles.semiBoldPoppins28(context).copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
