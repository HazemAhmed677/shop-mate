import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomLoadingBar extends StatelessWidget {
  const CustomLoadingBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          overlayColor: AppColors.white,
          minimumSize: Size(
            MediaQuery.of(context).size.width,
            56,
          ),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              32,
            ),
          ),
        ),
        onPressed: () {},
        child: const CircularProgressIndicator(
          strokeWidth: 3,
          color: AppColors.white,
        ),
      ),
    );
  }
}
