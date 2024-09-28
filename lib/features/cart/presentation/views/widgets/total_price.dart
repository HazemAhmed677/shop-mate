import 'package:flutter/material.dart';
import '../../../../../core/models/products_model/product_model.dart';
import '../../../../../core/utils/app_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: AppStyles.semiBoldPoppins28(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 24),
          ),
        ),
        Row(
          children: [
            Text(
              r'$',
              style: AppStyles.semiBoldPoppins28(context).copyWith(
                fontSize: getResponsiveText(context: context, base: 24),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product.price.toString(),
              style: AppStyles.semiBoldPoppins28(context).copyWith(
                fontSize: getResponsiveText(context: context, base: 24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
