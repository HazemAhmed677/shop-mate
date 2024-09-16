import 'package:flutter/material.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_recent_item.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_top_section.dart';
import '../../../../../core/helpers/confirmation_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomRecentUI extends StatelessWidget {
  const CustomRecentUI({
    super.key,
  });

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
                    'Recent',
                    style: AppStyles.semiBoldPoppins28.copyWith(
                      fontSize: 18,
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
                          fontSize: 18,
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
              ),
            ],
          ),
        ),
        SliverList.builder(
            itemCount: 24,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: (index != 23) ? 10.0 : 104,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 2,
                      bottom: 2,
                      left: 12.0,
                    ),
                    child: CustomRecentItem(
                      text: 'Blue Jack',
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}
