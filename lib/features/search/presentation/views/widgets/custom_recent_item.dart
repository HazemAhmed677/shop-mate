import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomRecentItem extends StatelessWidget {
  const CustomRecentItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.circleXmark,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
