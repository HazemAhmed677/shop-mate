import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

import '../utils/app_colors.dart';

void showConfirmationDialog(BuildContext context) {
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
