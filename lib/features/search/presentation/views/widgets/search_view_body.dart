import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_top_section.dart';

import '../../../../../core/helpers/confirmation_dialog.dart';
import '../../../../../core/utils/app_styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: CustomScrollView(
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
                      'Recent',
                      style: AppStyles.semiBoldPoppins28.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(14),
                      splashColor: AppColors.primaryColor.withOpacity(
                        0.2,
                      ),
                      onTap: () {
                        // toolTip
                        showConfirmationDialog(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Text(
                          'Clear All',
                          style: AppStyles.semiBoldPoppins28.copyWith(
                            fontSize: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 34,
                  color: Colors.grey.shade300,
                  thickness: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
