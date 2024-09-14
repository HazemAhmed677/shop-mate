import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.bottomDivider = false,
  });
  final IconData leadingIcon;
  final String title;
  final bool bottomDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(
            18,
          ),
          onTap: () {},
          child: ListTile(
            leading: Icon(
              leadingIcon,
              color: AppColors.primaryColor,
              size: 32,
            ),
            title: Text(title),
            trailing: const Icon(
              Icons.chevron_right,
              size: 32,
            ),
          ),
        ),
        (bottomDivider)
            ? Divider(
                height: 12,
                thickness: 1,
                color: Colors.grey.shade300,
              )
            : const SizedBox(),
      ],
    );
  }
}
