import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_mate/core/utils/app_images.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomMasterCard extends StatelessWidget {
  const CustomMasterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23.0,
          vertical: 16,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppImages.card,
              height: 35,
            ),
            const SizedBox(
              width: 23,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Credit Card',
                  style: AppStyles.regular24(context).copyWith(
                    fontSize: getResponsiveText(context: context, base: 18),
                  ),
                ),
                Text(
                  'Mastercard **78',
                  style: AppStyles.regular24(context).copyWith(
                    fontSize: getResponsiveText(context: context, base: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
