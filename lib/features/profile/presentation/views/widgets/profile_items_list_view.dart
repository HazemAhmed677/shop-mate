import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/features/profile/presentation/views/widgets/profile_item.dart';

class ProfileItemsListView extends StatelessWidget {
  const ProfileItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return const ProfileItem(
              leadingIcon: Icons.person,
              title: 'Your Profile',
              bottomDivider: true,
            );
          } else if (index == 1) {
            return const ProfileItem(
              leadingIcon: FontAwesomeIcons.creditCard,
              title: 'Payment Methods',
              bottomDivider: true,
            );
          } else if (index == 2) {
            return const ProfileItem(
              leadingIcon: FontAwesomeIcons.gear,
              title: 'Settings',
              bottomDivider: true,
            );
          } else if (index == 3) {
            return const ProfileItem(
              leadingIcon: FontAwesomeIcons.circleExclamation,
              title: 'Help Center',
              bottomDivider: true,
            );
          } else if (index == 4) {
            return const ProfileItem(
              leadingIcon: FontAwesomeIcons.lock,
              title: 'Privacy Policy',
              bottomDivider: true,
            );
          } else if (index == 5) {
            return const ProfileItem(
              leadingIcon: FontAwesomeIcons.rightToBracket,
              title: 'Log Out',
            );
          } else {
            return const SizedBox();
          }
        },
        childCount: 6,
      ),
    );
  }
}
