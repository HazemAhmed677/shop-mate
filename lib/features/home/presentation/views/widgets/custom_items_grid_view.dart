import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/grid_view_item.dart';

class CustomItemsGridView extends StatelessWidget {
  const CustomItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      initialItemCount: 10,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return const GridViewItem();
      },
    );
  }
}
