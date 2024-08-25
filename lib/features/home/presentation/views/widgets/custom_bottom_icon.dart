import 'package:flutter/material.dart';

class CustomBottomIcon extends StatelessWidget {
  const CustomBottomIcon({
    super.key,
    required this.color,
    this.onPressed,
    required this.icon,
  });

  final Color color;
  final Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}
