import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/manager/switch_views_cubit/switch_views_cubit.dart';
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
  double opacity = 0.0; // Initial opacity is 0 (invisible)

  @override
  void initState() {
    super.initState();
    // Trigger the fade-in effect after a short delay
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1.0; // Set opacity to 1 (fully visible)
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchViewsCubit, SwitchViewsState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            (state is HomeViewState)
                ? Scaffold(
                    body: AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 210),
                    child: const HomeViewBody(),
                  ))
                : (state is CartViewState)
                    ? const CartView()
                    : (state is FavoriteViewState)
                        ? const FavoriteView()
                        : (state is SearchViewState)
                            ? const SearchView()
                            : (state is ProfileViewState)
                                ? const ProfileView()
                                : const SizedBox(),
            const CustomNavBar(),
          ],
        );
      },
    );
  }
}
