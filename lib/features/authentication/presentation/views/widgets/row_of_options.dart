import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_option.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        InkWell(
          borderRadius: BorderRadius.circular(
            22,
          ),
          onTap: () {},
          child: CircleAvatar(
            radius: 26,
            child: Center(
              child: SvgPicture.asset(
                AppImages.google,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomOption(
          hight: 56,
          image: AppImages.facebook,
          onTap: () {},
          borderRadius: BorderRadius.circular(
            26,
          ),
        )
      ],
    );
  }
}
