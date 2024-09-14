import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_items_grid_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            Text('My Cart'),
            SizedBox(
              height: 22,
            ),
            CategoryListView(),
            SizedBox(
              height: 16,
            ),
            CustomItemsGridView(),
          ],
        ),
      ),
    );
  }
}
