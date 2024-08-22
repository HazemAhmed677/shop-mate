import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomTime extends StatelessWidget {
  const CustomTime({
    super.key,
    required this.time,
    this.flag = false,
  });
  final String time;
  final bool flag;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: const Color(0xffEEE5DB),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 6,
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        (!flag)
            ? const Text(
                ' : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
