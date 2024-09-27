import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          horizontal: 32,
          vertical: 18,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: () {},
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.bagShopping,
            color: Colors.green,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Checkout',
            style: AppStyles.regular24(context).copyWith(
              color: AppColors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
