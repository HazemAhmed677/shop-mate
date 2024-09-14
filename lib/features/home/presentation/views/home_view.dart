import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/cart/presentation/views/cart_view.dart';
import 'package:shop_mate/features/favorites/presentation/views/favorite_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_nav_bar.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:shop_mate/features/profile/presentation/views/profile_view.dart';
import 'package:shop_mate/features/search/presentation/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> views = [
    const HomeViewBody(),
    const CartView(),
    const FavoriteView(),
    const SearchView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          HomeViewBody(),
          CustomNavBar(),
        ],
      ),
    );
  }
}
