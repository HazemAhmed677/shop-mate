import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/product_details_body.dart';

import '../../../../core/models/products_model/product.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ProductDetailsViewBody(
        product: product,
      ),
    );
  }
}
