import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomColorItem extends StatelessWidget {
  const CustomColorItem(
      {super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: CircleAvatar(
          radius: 12,
          backgroundColor: (isActive) ? AppColors.white : Colors.transparent,
        ),
      ),
    );
  }
}
