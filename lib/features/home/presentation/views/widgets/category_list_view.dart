import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/features/home/data/models/categories_model.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/category_item.dart';

import '../../manager/fetch_products_cubit copy/fetch_products_cubit.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
    this.categoriesModel,
  });
  // nullabl temporary
  final CategoriesModel? categoriesModel;
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoriesModel!.categories!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: (widget.categoriesModel!.categories!.length - 1 != index)
                  ? 8.0
                  : 0,
              left: (index != 0) ? 8 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                if (currentIndex != index) {
                  BlocProvider.of<FetchProductsCubit>(context).fetchProducts(
                      category: widget.categoriesModel!.categories![index]);
                }
                currentIndex = index;
                setState(() {});
              },
              child: CategoryItem(
                isActive: (currentIndex == index),
                category: widget.categoriesModel!.categories![index],
              ),
            ),
          );
        },
      ),
    );
  }
}
