import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class RowOfDividers extends StatelessWidget {
  const RowOfDividers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            'Or sign in with',
            style: AppStyles.semiBoldInter16.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 32,
          ),
        ],
      ),
    );
  }
}
