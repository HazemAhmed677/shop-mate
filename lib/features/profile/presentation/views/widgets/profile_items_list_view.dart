import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/profile/presentation/views/widgets/custom_bottom_modal_sheet.dart';
import 'package:shop_mate/features/profile/presentation/views/widgets/profile_item.dart';

class ProfileItemsListView extends StatelessWidget {
  const ProfileItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return ProfileItem(
              leadingIcon: Icons.person,
              title: 'Your Profile',
              bottomDivider: true,
              onTap: () async {
                await FirebaseAuth.instance.currentUser!.reload();
                print(
                    'image = ${FirebaseAuth.instance.currentUser!.providerData[0].photoURL}');

                print('name = ${FirebaseAuth.instance.currentUser!}');
              },
            );
          } else if (index == 1) {
            return ProfileItem(
              leadingIcon: FontAwesomeIcons.creditCard,
              title: 'Payment Methods',
              bottomDivider: true,
              onTap: () {},
            );
          } else if (index == 2) {
            return ProfileItem(
              leadingIcon: FontAwesomeIcons.gear,
              title: 'Settings',
              bottomDivider: true,
              onTap: () {},
            );
          } else if (index == 3) {
            return const ProfileItem(
              leadingIcon: FontAwesomeIcons.circleExclamation,
              title: 'Help Center',
              bottomDivider: true,
            );
          } else if (index == 4) {
            return ProfileItem(
              leadingIcon: FontAwesomeIcons.lock,
              title: 'Privacy Policy',
              bottomDivider: true,
              onTap: () {},
            );
          } else if (index == 5) {
            return ProfileItem(
              leadingIcon: FontAwesomeIcons.rightToBracket,
              title: 'Log Out',
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.white,
                  isDismissible: true,
                  isScrollControlled: true,
                  sheetAnimationStyle: AnimationStyle(
                    curve: Curves.easeIn,
                    duration: const Duration(
                      milliseconds: 250,
                    ),
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20)),
                  ),
                  context: context,
                  builder: (context) => const CustomBottomModalSheet(),
                );
              },
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
