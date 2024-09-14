import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/home_view_body.dart';

class CustomHome extends StatefulWidget {
  const CustomHome({super.key});

  @override
  State<CustomHome> createState() => _CustomHomeState();
}

class _CustomHomeState extends State<CustomHome> {
  double opacity = 0.0; // Initial opacity is 0 (invisible)

  @override
  void initState() {
    super.initState();
    // Trigger the fade-in effect after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1.0; // Set opacity to 1 (fully visible)
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        body: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 110),
          child: const HomeViewBody(),
        ));
  }
}
