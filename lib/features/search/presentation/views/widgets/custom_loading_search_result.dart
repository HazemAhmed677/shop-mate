import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_items_grid_view.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_top_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomLoadingSearchResult extends StatelessWidget {
  const CustomLoadingSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SearchTopSection(),
        ),
        SliverToBoxAdapter(
          child: Skeletonizer(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      r'Result for "Jacket"',
                      style: AppStyles.semiBoldPoppins28.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '6,245 founds',
                      style: AppStyles.semiBoldPoppins28.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
        const CustomItemsGridView()
      ],
    );
  }
}
