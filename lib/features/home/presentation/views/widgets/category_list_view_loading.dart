import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/category_item_loading.dart';

class CategoryListViewLoading extends StatefulWidget {
  const CategoryListViewLoading({
    super.key,
  });
  @override
  State<CategoryListViewLoading> createState() =>
      _CategoryListViewLoadingState();
}

class _CategoryListViewLoadingState extends State<CategoryListViewLoading> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: (index != 9) ? 8.0 : 0,
              left: (index != 0) ? 8 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: const CategoryItemLoading(),
            ),
          );
        },
      ),
    );
  }
}
