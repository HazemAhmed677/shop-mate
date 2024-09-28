import 'package:flutter/material.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_top_section.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const SearchTopSection(),
              const Spacer(
                flex: 2,
              ),
              Text(
                text,
                style: AppStyles.semiBoldPoppins28(context).copyWith(
                  fontSize: getResponsiveText(context: context, base: 16),
                  color: Colors.grey,
                ),
              ),
              const Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ],
    );
  }
}
