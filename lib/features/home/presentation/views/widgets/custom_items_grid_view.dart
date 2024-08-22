import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomItemsGridView extends StatelessWidget {
  const CustomItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      initialItemCount: 10,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(AppImages.testImaagw)),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 6,
              top: 6,
              child: Icon(
                Icons.favorite_outline,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
