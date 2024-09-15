import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/grid_view_item_loading.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_routers.dart';

class LoadingGridView extends StatelessWidget {
  const LoadingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 14,
        childAspectRatio: 0.76,
      ),
      initialItemCount: 10,
      itemBuilder: (
        context,
        index,
        animation,
      ) {
        return InkWell(
          borderRadius: BorderRadius.circular(
            12,
          ),
          onTap: () {
            context.push(
              AppRouters.productDetails,
            );
          },
          child: const Skeletonizer(
            child: GridViewItemLoading(),
          ),
        );
      },
    );
  }
}
