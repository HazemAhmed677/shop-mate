import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/features/home/presentation/manager/fetch_all_categories_cubit/fetch_all_categories_cubit.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/category_list_view_loading.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_categoty_word.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_items_grid_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/flash_sale_row.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/home_view_header_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              bottom: false,
              left: false,
              right: false,
              child: HomeViewHeaderSection(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          const SliverToBoxAdapter(
            child: FlashSaleRow(),
          ),
          // changable

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomCategoryWord(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          BlocBuilder<FetchAllCategoriesCubit, FetchAllCategoriesState>(
            builder: (context, state) {
              if (state is FetchAllCategoriesLoading) {
                return const SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: true,
                    enableSwitchAnimation: true,
                    child: CategoryListViewLoading(),
                  ),
                );
              } else if (state is FetchAllCategoriesSuccess) {
                return SliverToBoxAdapter(
                  child: CategoryListView(
                    categoriesModel: state.categoriesModel,
                  ),
                );
              } else if (state is FetchAllCategoriesFailure) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.errorMsg),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 22,
            ),
          ),
          const CustomItemsGridView(),
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
