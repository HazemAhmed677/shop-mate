import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class SignWord extends StatelessWidget {
  const SignWord(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.height});
  final String title;
  final String subTitle;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height),
        Text(
          title,
          style: AppStyles.regular24,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subTitle,
          style: AppStyles.semiBoldPoppins28.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
