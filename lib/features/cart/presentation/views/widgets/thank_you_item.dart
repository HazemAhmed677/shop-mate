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
          style: AppStyles.regular24(context).copyWith(fontSize: 18),
        ),
        const Spacer(),
        Text(
          text2,
          style: AppStyles.semiBold24(context).copyWith(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
