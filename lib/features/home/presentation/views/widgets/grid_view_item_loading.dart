import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class GridViewItemLoading extends StatefulWidget {
  const GridViewItemLoading({
    super.key,
  });

  @override
  State<GridViewItemLoading> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItemLoading> {
  // Hive here
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  AppImages.testImage,
                ),
              ),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Row(
            children: [
              Text(
                'Brown Jacket',
                style: AppStyles.regular24.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Text(
            r"$200",
            style: AppStyles.semiBoldPoppins28.copyWith(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
