import 'package:flutter/material.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_up_view_body.dart';

import '../../../../core/utils/app_colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SignUpViewBody(),
    );
  }
}
