import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/features/search/presentation/manager/fetch_searched_products_cubit%20copy/fetch_searched_products_cubit.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_error_widget.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_loading_search_result.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_recent_ui.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_search_result.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchedProductsCubit, FetchSearchedProductsState>(
      builder: (context, state) {
        if (state is FetchSaerchedProductsLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22,
            ),
            child: CustomLoadingSearchResult(),
          );
        } else if (state is FetchSaerchedProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
            ),
            child: CustomSearchResult(
              productsModel: state.productsModel,
              searchedWord: state.searchedWord,
            ),
          );
        } else if (state is FetchSaerchedProductsFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
            ),
            child: CustomErrorWidget(text: state.errorMsg),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22,
            ),
            child: CustomRecentUI(),
          );
        }
      },
    );
  }
}
