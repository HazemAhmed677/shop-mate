import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_bottom_icon.dart';

class CusomNavigationBar extends StatefulWidget {
  const CusomNavigationBar({
    super.key,
  });

  @override
  State<CusomNavigationBar> createState() => _CusomNavigationBarState();
}

class _CusomNavigationBarState extends State<CusomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32,
        bottom: 22,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            32,
          ),
          color: const Color(
            0xff1F2029,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16,
          ),
          child: Row(
            children: List.generate(
              4,
              (index) {
                if (index == 0) {
                  return const CustomBottomIcon(
                    color: AppColors.white,
                    icon: Icon(IconlyLight.home,
                        color: AppColors.white, size: 28),
                  );
                } else if (index == 1) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: CustomBottomIcon(
                      color: AppColors.white,
                      icon: Icon(
                        IconlyLight.heart,
                        color: AppColors.white,
                        size: 28,
                      ),
                    ),
                  );
                } else if (index == 2) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: const CustomBottomIcon(
                      color: AppColors.white,
                      icon: Icon(
                        IconlyLight.search,
                        color: AppColors.white,
                        size: 28,
                      ),
                    ),
                  );
                } else {
                  return const CustomBottomIcon(
                    color: AppColors.white,
                    icon: Icon(
                      IconlyLight.profile,
                      color: AppColors.white,
                      size: 28,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
