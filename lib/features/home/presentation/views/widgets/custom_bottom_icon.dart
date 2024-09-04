import 'package:flutter/material.dart';

class CustomBottomIcon extends StatelessWidget {
  const CustomBottomIcon({
    super.key,
    required this.color,
    this.onPressed,
    required this.iconData,
  });

  final Color color;
  final Function()? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
    );
  }
}
