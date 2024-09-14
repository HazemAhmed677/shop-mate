import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'My Cart',
                style: AppStyles.semiBoldInter16.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
