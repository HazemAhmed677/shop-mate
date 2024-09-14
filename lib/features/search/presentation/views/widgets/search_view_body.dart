import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            Text('Search'),
          ],
        ),
      ),
    );
  }
}
