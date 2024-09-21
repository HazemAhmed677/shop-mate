import 'package:flutter/material.dart';

import '../../../../../core/helpers/confirmation_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class RecentMiddleSection extends StatefulWidget {
  const RecentMiddleSection({
    super.key,
  });

  @override
  State<RecentMiddleSection> createState() => _RecentMiddleSectionState();
}

class _RecentMiddleSectionState extends State<RecentMiddleSection> {
  // bool isDisposed = false;

  // @override
  // void dispose() {
  //   isDisposed = true; // Set the flag to true
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                if (mounted) {
                  showConfirmationDialog(context);
                }
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
    );
  }
}
