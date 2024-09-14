import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class MyCartTopSection extends StatelessWidget {
  const MyCartTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          left: false,
          right: false,
          child: Center(
            child: Text(
              'My Cart',
              style: AppStyles.semiBoldInter16.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
      ],
    );
  }
}
