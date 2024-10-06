import 'package:flutter/material.dart';
import 'package:shop_mate/core/widgets/custom_rate_widget.dart';

import '../../../../../core/models/products_model/product_model.dart';
import '../../../../../core/utils/app_styles.dart';

class GridViewItemBottomSection extends StatefulWidget {
  const GridViewItemBottomSection({super.key, required this.product});
  final ProductModel product;

  @override
  State<GridViewItemBottomSection> createState() =>
      _GridViewItemBottomSectionState();
}

class _GridViewItemBottomSectionState extends State<GridViewItemBottomSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 90,
                ),
                child: Text(
                  widget.product.title!,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.regular24(context).copyWith(
                    fontSize: getResponsiveText(context: context, base: 14),
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
                style: AppStyles.semiBoldPoppins28(context).copyWith(
                  fontSize: getResponsiveText(context: context, base: 12),
                ),
              ),
              Text(
                "${widget.product.price}",
                style: AppStyles.semiBoldPoppins28(context).copyWith(
                  fontSize: getResponsiveText(context: context, base: 12),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
