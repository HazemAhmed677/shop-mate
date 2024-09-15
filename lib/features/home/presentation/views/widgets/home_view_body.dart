import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_categoty_word.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_items_grid_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/flash_sale_row.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/home_view_header_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
                bottom: false,
                left: false,
                right: false,
                child: HomeViewHeaderSection()),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          SliverToBoxAdapter(
            child: FlashSaleRow(),
          ),
          // changable

          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomCategoryWord(),
          ),
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
              height: 22,
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
