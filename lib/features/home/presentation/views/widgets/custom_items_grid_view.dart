import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/features/home/presentation/manager/fetch_products_cubit%20copy/fetch_products_cubit.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/grid_view_item.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/loading_grid_view.dart';

class CustomItemsGridView extends StatefulWidget {
  const CustomItemsGridView({
    super.key,
  });

  @override
  State<CustomItemsGridView> createState() => _CustomItemsGridViewState();
}

class _CustomItemsGridViewState extends State<CustomItemsGridView> {
  @override
  void initState() {
    BlocProvider.of<FetchProductsCubit>(context).fetchProducts(category: 'tv');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProductsCubit, FetchProductsState>(
      builder: (context, state) {
        if (state is FetchProductsLoading) {
          return const LoadingGridView();
        } else if (state is FetchProductsSuccess) {
          return SliverAnimatedGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 10,
              childAspectRatio: 0.76,
            ),
            initialItemCount: state.productsModel.products?.length ?? 0,
            itemBuilder: (
              context,
              index,
              animation,
            ) {
              return GridViewItem(
                product: state.productsModel.products![index],
              );
            },
          );
        } else if (state is FetchProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMsg),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
