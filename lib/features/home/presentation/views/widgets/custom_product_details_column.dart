import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_rate_widget.dart';

class CustomProductDetailsColumn extends StatelessWidget {
  const CustomProductDetailsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                r"Female's Style",
                style: AppStyles.regular24.copyWith(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const CustomRateWidget(
                width: 6,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            r"Light Brown Jacket",
            style: AppStyles.regular24.copyWith(
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Product Details",
            style: AppStyles.semiBoldInter16.copyWith(
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'kjbjkbbibobb iuhon ibon ooiij pijo oo ono oni [j op ojo po uh oih  bo hohoihhpjio joi po joip0 oh 0 9 opjpok po[ [ k[[ [ [k [kopjpj p joij oi pijpj p jpj pj p j]]]]]]]',
            style: AppStyles.semiBoldInter16.copyWith(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Divider(
            height: 50,
            thickness: 1,
            color: Colors.grey.withOpacity(0.9),
          )
        ],
      ),
    );
  }
}
