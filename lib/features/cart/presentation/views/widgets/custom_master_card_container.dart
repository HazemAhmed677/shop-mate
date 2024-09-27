import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomMasterCard extends StatelessWidget {
  const CustomMasterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              'assets/images/masterCardsvg.svg',
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
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Mastercard **78',
                  style: AppStyles.regular24(context).copyWith(
                    fontSize: 16,
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
