import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_categoy_icon.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/home_view_header_section.dart';

import '../../../../../core/utils/app_styles.dart';

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
            const SliverToBoxAdapter(child: HomeViewHeaderSection()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 22,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: AppStyles.regular24.copyWith(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'See All',
                    style: AppStyles.semiBoldInter16.copyWith(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            // changable
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: (index == 4) ? 0 : 12,
                          left: (index == 0) ? 0 : 12,
                        ),
                        child: CustomCategoyIcon(
                          text: 'T-Shirts',
                          icon: Transform.translate(
                            offset: const Offset(-4, 0),
                            child: const Icon(
                              FontAwesomeIcons.shirt,
                              color: AppColors.primaryColor,
                              size: 28,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
