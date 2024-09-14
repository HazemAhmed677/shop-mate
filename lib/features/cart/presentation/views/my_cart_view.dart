import 'package:flutter/material.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_view_body.dart';
import '../../../../core/utils/app_colors.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  double opacity = 0.0; // Initial opacity is 0 (invisible)

  @override
  void initState() {
    super.initState();
    // Trigger the fade-in effect after a short delay
    Future.delayed(
        const Duration(
          milliseconds: 200,
        ), () {
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
        opacity: opacity,
        duration: const Duration(
          milliseconds: 210,
        ),
        child: const MyCartViewBody(),
      ),
    );
  }
}
