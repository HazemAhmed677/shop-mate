import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowOfOptions extends StatelessWidget {
  const RowOfOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(
            8,
          ),
          onTap: () {},
          child: SizedBox(
            height: 42,
            width: 46,
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: SvgPicture.asset(
                  AppImages.gmail,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(
            8,
          ),
          onTap: () {},
          child: SizedBox(
            height: 42,
            width: 46,
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: SvgPicture.asset(
                  AppImages.facebook,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
