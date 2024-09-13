import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomDetailsIcon extends StatelessWidget {
  const CustomDetailsIcon({super.key, required this.icon, required this.onTap});
  final Icon icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryColor,
      onTap: onTap,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 22,
          child: icon,
        ),
      ),
    );
  }
}
