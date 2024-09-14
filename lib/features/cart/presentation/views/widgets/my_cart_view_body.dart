import 'package:flutter/material.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_item_list_view.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_top_section.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: MyCartTopSection(),
          ),
          MyCartItemListView()
        ],
      ),
    );
  }
}
