import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routers.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: AppStyles.regular24.copyWith(
            fontSize: 15,
            color: Colors.grey.shade700,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () {
            GoRouter.of(context).push(
              AppRouters.register,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 1,
            ),
            child: Text(
              'Sign Up',
              style: AppStyles.regular24.copyWith(
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                  color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
