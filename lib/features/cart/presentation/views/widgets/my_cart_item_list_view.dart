import 'package:flutter/material.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_item.dart';

class MyCartItemListView extends StatelessWidget {
  const MyCartItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => (index != 9)
          ? const MyCartItem()
          : const MyCartItem(
              bottomDivider: false,
            ),
    );
  }
}
