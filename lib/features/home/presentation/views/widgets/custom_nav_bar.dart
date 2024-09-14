import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_bottom_icon.dart';

import '../../../../../core/manager/switch_views_cubit/switch_views_cubit.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  State<CustomNavBar> createState() => _CusomNavigationBarState();
}

class _CusomNavigationBarState extends State<CustomNavBar> {
  late int currentIndex;
  @override
  Widget build(BuildContext context) {
    currentIndex = BlocProvider.of<SwitchViewsCubit>(context).index;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 18,
        left: 22,
        right: 22,
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            38,
          ),
          color: const Color(
            0xff1F2029,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 9.0,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              5,
              (index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      BlocProvider.of<SwitchViewsCubit>(context).setIndex(0);
                    },
                    child: CustomBottomIcon(
                      color: AppColors.white,
                      icon: Icon(
                        currentIndex == index
                            ? IconlyBold.home
                            : IconlyLight.home,
                        color: currentIndex == index
                            ? AppColors.primaryColor
                            : AppColors.white,
                        size: 26,
                      ),
                      isActive: currentIndex == index,
                    ),
                  );
                } else if (index == 1) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      BlocProvider.of<SwitchViewsCubit>(context).setIndex(1);
                    },
                    child: CustomBottomIcon(
                      color: AppColors.white,
                      icon: Icon(
                        currentIndex == index
                            ? IconlyBold.bag
                            : IconlyLight.bag,
                        color: currentIndex == index
                            ? AppColors.primaryColor
                            : AppColors.white,
                        size: 26,
                      ),
                      isActive: currentIndex == index,
                    ),
                  );
                } else if (index == 2) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      BlocProvider.of<SwitchViewsCubit>(context).setIndex(2);
                    },
                    child: CustomBottomIcon(
                      color: AppColors.white,
                      icon: Icon(
                        currentIndex == index
                            ? IconlyBold.heart
                            : IconlyLight.heart,
                        color: currentIndex == index
                            ? AppColors.primaryColor
                            : AppColors.white,
                        size: 26,
                      ),
                      isActive: currentIndex == index,
                    ),
                  );
                } else if (index == 3) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      BlocProvider.of<SwitchViewsCubit>(context).setIndex(3);
                    },
                    child: CustomBottomIcon(
                      color: AppColors.white,
                      icon: Icon(
                        currentIndex == index
                            ? IconlyBold.search
                            : IconlyLight.search,
                        color: currentIndex == index
                            ? AppColors.primaryColor
                            : AppColors.white,
                        size: 26,
                      ),
                      isActive: currentIndex == index,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      BlocProvider.of<SwitchViewsCubit>(context).setIndex(4);
                    },
                    child: CustomBottomIcon(
                      color: AppColors.white,
                      icon: Icon(
                        currentIndex == index
                            ? IconlyBold.profile
                            : IconlyLight.profile,
                        color: currentIndex == index
                            ? AppColors.primaryColor
                            : AppColors.white,
                        size: 26,
                      ),
                      isActive: currentIndex == index,
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
