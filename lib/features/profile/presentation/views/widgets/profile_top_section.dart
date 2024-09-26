import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({super.key});

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
              'Profile',
              style: AppStyles.semiBoldInter16.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        const Center(
          child: CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage(AppImages.testImage),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Center(
          child: Text(
            'Hazem Ahmed',
            style: AppStyles.regular24.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }
}
