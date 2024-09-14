import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class CustomLogOutButton extends StatelessWidget {
  const CustomLogOutButton({
    super.key,
    required this.onPressed,
    required this.edgeColor,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.overlayColor,
  });
  final Color edgeColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Color overlayColor;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2 - 32,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          28,
        ),
        border: Border.all(
          width: 2,
          color: edgeColor,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          overlayColor: overlayColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.regular24.copyWith(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
