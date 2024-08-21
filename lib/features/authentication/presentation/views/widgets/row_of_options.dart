import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_option.dart';

class RowOfOptions extends StatelessWidget {
  const RowOfOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomOption(
          hight: 42,
          image: AppImages.mail,
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(
          width: 16,
        ),
        CustomOption(
          hight: 60,
          image: AppImages.google,
          onTap: () {},
          borderRadius: BorderRadius.circular(24),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomOption(
          hight: 60,
          image: AppImages.facebook,
          onTap: () {},
          borderRadius: BorderRadius.circular(24),
        )
      ],
    );
  }
}
