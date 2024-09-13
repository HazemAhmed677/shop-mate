import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/add_to_cart.dart';

class ProductDetailsBottomContainer extends StatelessWidget {
  const ProductDetailsBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 6,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 18,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: AppStyles.semiBoldInter16.copyWith(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  r'$83.97',
                  style: AppStyles.semiBoldInter16.copyWith(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const AddToCart()
          ],
        ),
      ),
    );
  }
}
