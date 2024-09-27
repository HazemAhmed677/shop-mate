import 'package:flutter/material.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: AppColors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 52,
          vertical: 20,
        ),
        backgroundColor: Colors.green,
      ),
      onPressed: () {
        // present stripe sheet here
      },
      child: Text(
        'Checkout',
        style: AppStyles.regular24(context).copyWith(
          color: AppColors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}
