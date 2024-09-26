import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.onPressed});
  final Function() onPressed;
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
      onPressed: onPressed,
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.bagShopping,
            color: AppColors.white,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Add to Cart',
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
