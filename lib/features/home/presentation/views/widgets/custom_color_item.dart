import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomColorItem extends StatelessWidget {
  const CustomColorItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.brown,
        child: CircleAvatar(
          radius: 12,
          backgroundColor: (isActive) ? AppColors.white : Colors.transparent,
        ),
      ),
    );
  }
}
