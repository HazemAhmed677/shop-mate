import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_top_section.dart';

import '../../../../../core/utils/app_styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void showConfirmationDialog() {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents dismissing by tapping outside
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(
              0xff1F2029,
            ),
            title: Text(
              'Are you sure to clear all data?',
              style: AppStyles.semiBoldPoppins28.copyWith(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  overlayColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                },
                child: Text(
                  'Cancel',
                  style: AppStyles.semiBoldPoppins28.copyWith(
                    fontSize: 15,
                    color: AppColors.white,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(overlayColor: Colors.white),
                onPressed: () {
                  // remove from db
                  //show snackbar
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Confirm',
                  style: AppStyles.semiBoldPoppins28.copyWith(
                    fontSize: 15,
                    color: Colors.red.shade300,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

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
                        showConfirmationDialog();
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
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
