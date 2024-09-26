import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class CustomCategoyIcon extends StatelessWidget {
  const CustomCategoyIcon({super.key, required this.text, required this.icon});
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 34,
          backgroundColor: const Color(0xffF7F2ED),
          child: icon,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          text,
          style: AppStyles.semiBoldPoppins28(context).copyWith(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
