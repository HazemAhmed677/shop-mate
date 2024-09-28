import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class ThankYouWord extends StatelessWidget {
  const ThankYouWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 66,
        ),
        Text(
          'Thank you!',
          style: AppStyles.regular24(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 25),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Opacity(
          opacity: 0.8,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Your transaction was successful',
              style: AppStyles.regular24(context).copyWith(
                fontSize: getResponsiveText(context: context, base: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
