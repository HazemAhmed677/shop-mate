import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomNextPrevButton extends StatelessWidget {
  const CustomNextPrevButton(
      {super.key,
      required this.child,
      this.onPressed,
      required this.backgroundColor});
  final Widget child;
  final Function()? onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        32,
      ),
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 30,
        child: CircleAvatar(
          radius: 28,
          backgroundColor: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
