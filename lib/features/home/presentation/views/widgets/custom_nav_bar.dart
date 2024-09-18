import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_bottom_icon.dart';
import '../../../../../core/manager/switch_views_cubit/switch_views_cubit.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: BlocBuilder<SwitchViewsCubit, SwitchViewsState>(
            builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<SwitchViewsCubit>(context)
                              .setIndex(0);
                        },
                        child: CustomBottomIcon(
                          color: AppColors.white,
                          icon: Icon(
                            state is HomeViewState
                                ? IconlyBold.home
                                : IconlyLight.home,
                            color: state is HomeViewState
                                ? AppColors.primaryColor
                                : AppColors.white,
                            size: 26,
                          ),
                          isActive: state is HomeViewState,
                        ),
                      );
                    } else if (index == 1) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<SwitchViewsCubit>(context)
                              .setIndex(1);
                        },
                        child: CustomBottomIcon(
                          color: AppColors.white,
                          icon: Icon(
                            state is CartViewState
                                ? IconlyBold.bag
                                : IconlyLight.bag,
                            color: state is CartViewState
                                ? AppColors.primaryColor
                                : AppColors.white,
                            size: 26,
                          ),
                          isActive: state is CartViewState,
                        ),
                      );
                    } else if (index == 2) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<SwitchViewsCubit>(context)
                              .setIndex(2);
                        },
                        child: CustomBottomIcon(
                          color: AppColors.white,
                          icon: Icon(
                            state is FavoriteViewState
                                ? IconlyBold.heart
                                : IconlyLight.heart,
                            color: state is FavoriteViewState
                                ? AppColors.primaryColor
                                : AppColors.white,
                            size: 26,
                          ),
                          isActive: state is FavoriteViewState,
                        ),
                      );
                    } else if (index == 3) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<SwitchViewsCubit>(context)
                              .setIndex(3);
                        },
                        child: CustomBottomIcon(
                          color: AppColors.white,
                          icon: Icon(
                            state is SearchViewState
                                ? IconlyBold.search
                                : IconlyLight.search,
                            color: state is SearchViewState
                                ? AppColors.primaryColor
                                : AppColors.white,
                            size: 26,
                          ),
                          isActive: state is SearchViewState,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<SwitchViewsCubit>(context)
                              .setIndex(4);
                        },
                        child: CustomBottomIcon(
                          color: AppColors.white,
                          icon: Icon(
                            state is ProfileViewState
                                ? IconlyBold.profile
                                : IconlyLight.profile,
                            color: state is ProfileViewState
                                ? AppColors.primaryColor
                                : AppColors.white,
                            size: 26,
                          ),
                          isActive: state is ProfileViewState,
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
