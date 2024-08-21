import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class LoremText extends StatelessWidget {
  const LoremText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur',
            style: AppStyles.semiBoldInter16.copyWith(
              color: Colors.grey,
            ),
          ),
          Text(
            'adipiscing elit, sed do eiusmod tempor incididunt',
            style: AppStyles.semiBoldInter16.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
