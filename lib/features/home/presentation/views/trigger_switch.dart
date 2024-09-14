import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/manager/switch_views_cubit/switch_views_cubit.dart';
import 'package:shop_mate/features/cart/presentation/views/cart_view.dart';
import 'package:shop_mate/features/favorites/presentation/views/favorite_view.dart';
import 'package:shop_mate/features/home/presentation/views/home_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_nav_bar.dart';
import 'package:shop_mate/features/profile/presentation/views/profile_view.dart';
import 'package:shop_mate/features/search/presentation/views/search_view.dart';

class TriggerSwitch extends StatefulWidget {
  const TriggerSwitch({super.key});

  @override
  State<TriggerSwitch> createState() => _TriggerSwitchState();
}

class _TriggerSwitchState extends State<TriggerSwitch> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SwitchViewsCubit>(context).setIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchViewsCubit, SwitchViewsState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            (state is HomeViewState)
                ? const HomeView()
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
