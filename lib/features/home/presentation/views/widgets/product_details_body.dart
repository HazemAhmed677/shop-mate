import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_product_details_column.dart';

import 'package:shop_mate/features/home/presentation/views/widgets/custom_produst_details_stack.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/product_details_bottom_container.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomProdustDetailsStack(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomProductDetailsColumn(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 26,
          ),
        ),
        SliverToBoxAdapter(
          child: ProductDetailsBottomContainer(),
        )
      ],
    );
  }
}
