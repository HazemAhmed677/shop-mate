import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_details_icon.dart';

import '../../../../../core/utils/app_images.dart';

class CustomProdustDetailsStack extends StatefulWidget {
  const CustomProdustDetailsStack({super.key});

  @override
  State<CustomProdustDetailsStack> createState() =>
      _CustomProdustDetailsStackState();
}

class _CustomProdustDetailsStackState extends State<CustomProdustDetailsStack> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            AppImages.testImage,
          ),
        ),
        Positioned(
          left: 26,
          top: 22,
          child: CustomDetailsIcon(
            onTap: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              IconlyLight.arrow_left,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
        Positioned(
          right: 26,
          top: 22,
          child: CustomDetailsIcon(
            onTap: () {
              flag = !flag;
              setState(
                () {},
              );
            },
            icon: (!flag)
                ? const Icon(
                    IconlyLight.heart,
                    color: Colors.black,
                    size: 28,
                  )
                : const Icon(
                    IconlyBold.heart,
                    color: Colors.black,
                    size: 28,
                  ),
          ),
        )
      ],
    );
  }
}
