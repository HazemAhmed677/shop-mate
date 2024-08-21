import 'package:flutter/material.dart';

class CustomNextPrevButton extends StatelessWidget {
  const CustomNextPrevButton({super.key, required this.child, this.onPressed});
  final Widget child;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
