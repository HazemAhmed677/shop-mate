import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import 'search_top_section.dart';

class CustomRecentEmptySearched extends StatelessWidget {
  const CustomRecentEmptySearched({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SearchTopSection(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Transform.translate(
            offset: const Offset(0, -60),
            child: Center(
              child: Text(
                text,
                style: AppStyles.semiBoldPoppins28(context).copyWith(
                  fontSize: getResponsiveText(context: context, base: 16),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
