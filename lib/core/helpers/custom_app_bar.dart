import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_images.dart';

AppBar buildAppBar({
  required Function() onTap,
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: const EdgeInsets.only(
        left: 14,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          12,
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 6,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.back,
            ),
          ),
        ),
      ),
    ),
  );
}
