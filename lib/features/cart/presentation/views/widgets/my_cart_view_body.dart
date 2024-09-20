import 'package:flutter/material.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_item_list_view.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_top_section.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: MyCartTopSection(),
        ),
        MyCartItemListView(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 104,
          ),
        ),
      ],
    );
  }
}
