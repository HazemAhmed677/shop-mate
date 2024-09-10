import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class GridViewItem extends StatefulWidget {
  const GridViewItem({
    super.key,
  });

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  // Hive here
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
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
                    12,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 6,
              top: 6,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.white.withOpacity(
                  0.7,
                ),
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  child: IconButton(
                    highlightColor: AppColors.white.withOpacity(
                      0.4,
                    ),
                    hoverColor: AppColors.white.withOpacity(
                      0.2,
                    ),
                    onPressed: () {
                      flag = !flag;
                      setState(() {});
                    },
                    icon: Icon(
                      (!flag)
                          ? FontAwesomeIcons.heart
                          : FontAwesomeIcons.solidHeart,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6.0,
          ),
          child: Row(
            children: [
              Text(
                'Brown Jacket',
                style: AppStyles.regular24.copyWith(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 14,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '4.5',
                style: AppStyles.regular24.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
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
            horizontal: 6.0,
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
