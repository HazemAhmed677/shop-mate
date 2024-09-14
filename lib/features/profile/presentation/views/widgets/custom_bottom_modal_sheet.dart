import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/features/profile/presentation/views/widgets/custom_logout_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomBottomModalSheet extends StatelessWidget {
  const CustomBottomModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 12,
          ),
          Divider(
            thickness: 4,
            color: Colors.grey.shade300,
            indent: MediaQuery.sizeOf(context).width * 0.35,
            endIndent: MediaQuery.sizeOf(context).width * 0.35,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Logout',
            style: AppStyles.semiBoldPoppins28.copyWith(
              fontSize: 24,
              color: Colors.grey,
            ),
          ),
          Divider(
            height: 38,
            thickness: 1,
            color: Colors.grey.shade400,
          ),
          Text(
            'Are you sure you want to log out?',
            style: AppStyles.semiBoldPoppins28.copyWith(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLogOutButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                text: 'Cancel',
                edgeColor: AppColors.primaryColor,
                backgroundColor: AppColors.white,
                textColor: AppColors.primaryColor,
                overlayColor: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomLogOutButton(
                onPressed: () {
                  // sign out here
                },
                text: 'Yes, Logout',
                edgeColor: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.white,
                overlayColor: AppColors.white,
              ),
            ],
          ),
          const SafeArea(
            top: false,
            left: false,
            right: false,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
