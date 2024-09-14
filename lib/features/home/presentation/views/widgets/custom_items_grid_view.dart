import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/grid_view_item.dart';

class CustomItemsGridView extends StatelessWidget {
  const CustomItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemCount: 10,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return InkWell(
          borderRadius: BorderRadius.circular(
            12,
          ),
          onTap: () {
            GoRouter.of(context).push(
              AppRouters.productDetails,
            );
          },
          child: const GridViewItem(),
        );
      },
    );
  }
}
