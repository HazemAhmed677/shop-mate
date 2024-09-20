import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class RemoveFromCart extends StatelessWidget {
  const RemoveFromCart({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
        overlayColor: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
        backgroundColor: AppColors.white,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.check,
            color: Colors.green,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Remove from Cart',
              style: AppStyles.regular24.copyWith(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
