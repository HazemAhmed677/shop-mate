import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/manager/fetch_favorites_cubit.dart/fetch_all_favorite_products_cubit.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/grid_view_item.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomFavoritesGridView extends StatelessWidget {
  const CustomFavoritesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllFavoriteProductsCubit,
        FetchAllFavoriteProductsState>(
      builder: (context, state) {
        if (state is FetchAllFavoriteProductsSuccess) {
          var product = state.productsList;
          return (product.isEmpty)
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Transform.translate(
                    offset: const Offset(0, -60),
                    child: Center(
                      child: Text(
                        'No products saved yet',
                        style: AppStyles.semiBoldPoppins28.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.76,
                  ),
                  itemCount: state.productsList.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return GridViewItem(
                      product: state.productsList[index],
                    );
                  },
                );
        } else if (state is FetchAllFavoriteProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessege),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Text(
              'No Favorite Products yet',
              style: AppStyles.semiBoldPoppins28.copyWith(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          );
        }
      },
    );
  }
}
