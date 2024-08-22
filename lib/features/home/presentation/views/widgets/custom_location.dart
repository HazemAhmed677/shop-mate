import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomLocation extends StatelessWidget {
  const CustomLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: AppStyles.regular24.copyWith(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.locationDot,
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Cairo, Egypt',
              style: AppStyles.semiBoldInter16.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Transform.rotate(
              angle: -1.5708,
              child: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ],
        )
      ],
    );
  }
}
