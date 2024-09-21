import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_recent_item.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/recent_middle_section.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_top_section.dart';

import '../../manager/fetch_searched_products_cubit copy/fetch_searched_products_cubit.dart';

class CustomRecentExistedSearched extends StatelessWidget {
  const CustomRecentExistedSearched({
    super.key,
    required this.searches,
  });
  final List<String> searches;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SearchTopSection(),
        ),
        const SliverToBoxAdapter(
          child: RecentMiddleSection(),
        ),
        SliverList.builder(
            itemCount: searches.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: (index != 23) ? 10.0 : 104,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                  onTap: () async {
                    await BlocProvider.of<FetchSearchedProductsCubit>(context)
                        .searchProducts(
                      category: searches[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                      bottom: 2,
                      left: 12.0,
                    ),
                    child: CustomRecentItem(
                      text: searches[index],
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}
