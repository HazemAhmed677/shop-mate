import 'package:flutter/material.dart';
import 'package:shop_mate/features/favorites/presentation/views/widgets/favorite_view_body.dart';
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
    // Trigger the fade-in effect after a short delay
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0; // Set opacity to 1 (fully visible)
      });
    });
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
          child: const FavoriteViewBody()),
    );
  }
}
