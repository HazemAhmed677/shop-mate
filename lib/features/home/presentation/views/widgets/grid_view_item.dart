import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/features/home/data/models/products_model/product.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_rate_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class GridViewItem extends StatefulWidget {
  const GridViewItem({
    super.key,
    required this.product,
  });
  final Product product;
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
                  image: DecorationImage(
                    image: (widget.product.image == null)
                        ? const AssetImage(AppImages.noImage)
                        : CachedNetworkImageProvider(
                            widget.product.image!,
                          ),
                  ),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
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
            horizontal: 8.0,
          ),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 104,
                ),
                child: Text(
                  widget.product.title!,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.regular24.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              const Spacer(),
              const CustomRateWidget(
                width: 2,
              )
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
          child: Row(
            children: [
              Text(
                r"$",
                style: AppStyles.semiBoldPoppins28.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                "${widget.product.price}",
                style: AppStyles.semiBoldPoppins28.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
