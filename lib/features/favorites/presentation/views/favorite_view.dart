import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/features/favorites/presentation/views/widgets/favorite_view_body.dart';
import '../../../../core/manager/fetch_favorites_cubit.dart/fetch_all_favorite_products_cubit.dart';
import '../../../../core/utils/app_colors.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  double opacity = 0.0; // Initial opacity is 0 (invisible)

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0;
      });
    });
    BlocProvider.of<FetchAllFavoriteProductsCubit>(context).fetchAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 210,
        ),
        opacity: opacity,
        child: const FavoriteViewBody(),
      ),
    );
  }
}
