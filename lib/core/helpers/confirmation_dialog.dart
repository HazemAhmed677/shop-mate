import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/manager/fetch_search_box_cubit.dart/fetch_search_box_cubit.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

import '../manager/delete_from_search_box_cubit/delete_from_search_cubit.dart';
import '../utils/app_colors.dart';

void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents dismissing by tapping outside
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(
          0xff1F2029,
        ),
        title: Text(
          'Are you sure to clear all data?',
          style: AppStyles.semiBoldPoppins28(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 16),
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
              style: AppStyles.semiBoldPoppins28(context).copyWith(
                fontSize: getResponsiveText(context: context, base: 15),
                color: AppColors.white,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(overlayColor: Colors.white),
            onPressed: () async {
              await BlocProvider.of<DeleteFromSearchCubit>(context).clearAll();
              if (context.mounted) {
                BlocProvider.of<FetchSearchBoxCubit>(context).fetchSearchBox();
                Navigator.of(context).pop();
              }
            },
            child: Text(
              'Confirm',
              style: AppStyles.semiBoldPoppins28(context).copyWith(
                fontSize: getResponsiveText(context: context, base: 15),
                color: Colors.red.shade300,
              ),
            ),
          ),
        ],
      );
    },
  );
}
