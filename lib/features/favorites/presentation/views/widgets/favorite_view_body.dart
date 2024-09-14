import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/category_list_view.dart';
import '../../../../home/presentation/views/widgets/custom_items_grid_view.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverToBoxAdapter(
              child: SafeArea(
                  bottom: false,
                  left: false,
                  right: false,
                  child: Text('My Wishlist'))),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          SliverToBoxAdapter(
            child: CategoryListView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          CustomItemsGridView(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 104,
            ),
          ),
        ],
      ),
    );
  }
}
