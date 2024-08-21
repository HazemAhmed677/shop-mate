import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomDots extends StatelessWidget {
  const CustomDots({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 6.0,
          ),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 150,
            ),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: (index == currentIndex)
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.2),
            ),
          ),
        );
      }),
    );
  }
}
