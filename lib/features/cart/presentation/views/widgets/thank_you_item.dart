import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class ThankYouItem extends StatelessWidget {
  const ThankYouItem({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: AppStyles.regular24(context).copyWith(
              fontSize: getResponsiveText(context: context, base: 18)),
        ),
        const Spacer(),
        Text(
          text2,
          style: AppStyles.semiBoldPoppins28(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 18),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
