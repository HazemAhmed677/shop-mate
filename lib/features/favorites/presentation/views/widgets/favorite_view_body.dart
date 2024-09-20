import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/favorites/presentation/views/widgets/custom_favorites_grid_view.dart';

import '../../../../home/presentation/views/widgets/category_list_view.dart';
import '../../../../home/presentation/views/widgets/custom_items_grid_view.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: Center(
                child: Text(
                  'My Wishlist',
                  style: AppStyles.semiBoldInter16.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          // const SliverToBoxAdapter(
          //   child: CategoryListView(),
          // ),
          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 16,
          //   ),
          // ),
          const CustomFavoritesGridView(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 104,
            ),
          ),
        ],
      ),
    );
  }
}
