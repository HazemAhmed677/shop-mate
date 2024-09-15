import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_rate_widget.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/products_model/product.dart';

class ProductDetailsColumnTopSection extends StatelessWidget {
  const ProductDetailsColumnTopSection({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${product.brand}",
              style: AppStyles.regular24.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            const CustomRateWidget(
              width: 6,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "${product.title}",
          style: AppStyles.regular24.copyWith(
            fontSize: 22,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Product Details",
          style: AppStyles.semiBoldInter16.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          '${product.description}',
          style: AppStyles.semiBoldInter16.copyWith(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
