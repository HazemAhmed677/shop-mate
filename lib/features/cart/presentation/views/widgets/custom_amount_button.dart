import 'package:flutter/material.dart';

class CustomAmountButton extends StatelessWidget {
  const CustomAmountButton(
      {super.key,
      required this.iconData,
      required this.backgroundColor,
      this.onPressed,
      required this.iconColor,
      required this.overlayColor});
  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor;
  final Color overlayColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          overlayColor: overlayColor,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Icon(
          iconData,
          color: iconColor,
          size: 16,
        ),
      ),
    );
  }
}
