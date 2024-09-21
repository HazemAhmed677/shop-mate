import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/models/products_model/products_model.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/grid_view_item.dart';
import '../../../../../core/utils/app_routers.dart';

class CustomSearchedGridView extends StatelessWidget {
  const CustomSearchedGridView({
    super.key,
    required this.productsModel,
  });
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return SliverAnimatedGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 14,
        childAspectRatio: 0.76,
      ),
      initialItemCount: productsModel.products?.length ?? 0,
      itemBuilder: (
        context,
        index,
        animation,
      ) {
        return GridViewItem(
          product: productsModel.products![index],
        );
      },
    );
  }
}
