import 'package:flutter/material.dart';
import 'package:shop_mate/core/models/products_model/products_model.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_searched_grid_view.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_top_section.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomSearchResult extends StatelessWidget {
  const CustomSearchResult(
      {super.key, required this.productsModel, required this.searchedWord});
  final ProductsModel productsModel;
  final String searchedWord;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SearchTopSection(),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    r'Result for "',
                    style: AppStyles.semiBoldPoppins28(context).copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    searchedWord,
                    style: AppStyles.semiBoldPoppins28(context).copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    r'"',
                    style: AppStyles.semiBoldPoppins28(context).copyWith(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${productsModel.products?.length ?? 0} founds',
                    style: AppStyles.semiBoldPoppins28(context).copyWith(
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
        CustomSearchedGridView(productsModel: productsModel),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 104,
          ),
        ),
      ],
    );
  }
}
