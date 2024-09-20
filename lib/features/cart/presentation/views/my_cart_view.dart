import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/manager/fetch_cart_cubit.dart%20copy/fetch_cart_products_cubit.dart';
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
    handleOpacity();
    BlocProvider.of<FetchCartProductsCubit>(context).fetchCartProducts();
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

  void handleOpacity() {
    Future.delayed(
        const Duration(
          milliseconds: 200,
        ), () {
      setState(() {
        opacity = 1.0; // Set opacity to 1 (fully visible)
      });
    });
  }
}
