import 'package:flutter/material.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_recent_ui.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  // listen here for searching
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0),
      child: CustomRecentUI(),
      // child: CustomSearchResult(),
    );
  }
}
