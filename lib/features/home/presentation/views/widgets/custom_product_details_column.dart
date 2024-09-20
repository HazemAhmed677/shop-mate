import 'package:flutter/material.dart';
import 'package:shop_mate/core/models/products_model/product.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/color_list_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/product_details_column_top_section.dart';

class CustomProductDetailsColumn extends StatelessWidget {
  const CustomProductDetailsColumn({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsColumnTopSection(
            product: product,
          ),
          Divider(
            height: 50,
            thickness: 1,
            color: Colors.grey.withOpacity(0.9),
          ),
          // Text(
          //   'Select Size',
          //   style: AppStyles.semiBoldInter16.copyWith(
          //     fontSize: 20,
          //   ),
          // ),
          // const SizedBox(
          //   height: 12,
          // ),
          // const SizeListView(),
          // const SizedBox(
          //   height: 16,
          // ),
          const ColorListView(),
        ],
      ),
    );
  }
}
