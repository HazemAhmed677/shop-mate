import 'package:flutter/material.dart';

import 'add_to_cart.dart';
import 'remove_from_cart.dart';

class CustomSwitchBottomBottons extends StatefulWidget {
  const CustomSwitchBottomBottons({
    super.key,
  });

  @override
  State<CustomSwitchBottomBottons> createState() =>
      _CustomSwitchBottomBottonsState();
}

class _CustomSwitchBottomBottonsState extends State<CustomSwitchBottomBottons> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300), // Animation duration
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
            scale: animation, child: child); // Animation effect
      },
      child: flag
          ? RemoveFromCart(
              onPressed: () {
                flag = !flag;
                setState(() {});
              },
            )
          : AddToCart(
              onPressed: () {
                flag = !flag;
                setState(() {});
              },
            ),
    );
  }
}
