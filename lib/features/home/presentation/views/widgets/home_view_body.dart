import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'custom_location.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  const CustomLocation(),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                    child: const Icon(
                      FontAwesomeIcons.solidBell,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
