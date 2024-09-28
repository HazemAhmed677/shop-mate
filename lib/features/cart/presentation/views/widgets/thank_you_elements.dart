import 'package:flutter/material.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/thank_you_word.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/total_price.dart';

import 'all_item_of_thank_you.dart';

class ThankYouElements extends StatelessWidget {
  const ThankYouElements({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ThankYouWord(),
        const AllItemsOfThankYou(),
        const Divider(
          thickness: 2,
          color: Color(0xffC7C7C7),
        ),
        const SizedBox(
          height: 12,
        ),
        TotalPrice(product: product),
      ],
    );
  }
}
