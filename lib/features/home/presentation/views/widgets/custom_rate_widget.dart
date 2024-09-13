import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomRateWidget extends StatelessWidget {
  const CustomRateWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          IconlyBold.star,
          color: Color(0xffFCAF23),
          size: 20,
        ),
        SizedBox(
          width: width,
        ),
        Text(
          '4.5',
          style: AppStyles.regular24.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
