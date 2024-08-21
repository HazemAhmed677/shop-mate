import 'package:flutter/material.dart';

class CustomOption extends StatelessWidget {
  const CustomOption(
      {super.key,
      required this.hight,
      required this.image,
      required this.onTap,
      required this.borderRadius});
  final double hight;
  final String image;
  final Function() onTap;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: SizedBox(
        height: hight,
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(image),
        ),
      ),
    );
  }
}
