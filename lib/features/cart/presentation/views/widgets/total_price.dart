import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: AppStyles.semiBold24(context),
        ),
        Text(
          r'$50.97',
          style: AppStyles.semiBold24(context),
        ),
      ],
    );
  }
}
