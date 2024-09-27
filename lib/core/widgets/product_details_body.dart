import 'package:flutter/material.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/widgets/custom_product_details_column.dart';

import 'package:shop_mate/core/widgets/custom_produst_details_stack.dart';
import 'package:shop_mate/core/widgets/product_details_bottom_container.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody(
      {super.key, required this.product, required this.isCheckout});
  final ProductModel product;
  final bool isCheckout;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CustomProdustDetailsStack(
            product: product,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomProductDetailsColumn(
            product: product,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 26,
          ),
        ),
        SliverToBoxAdapter(
          child: ProductDetailsBottomContainer(
            product: product,
            isCheckOut: isCheckout,
          ),
        )
      ],
    );
  }
}
