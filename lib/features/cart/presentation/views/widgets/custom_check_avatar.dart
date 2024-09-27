import 'package:flutter/material.dart';

class CustomCheckAvatar extends StatelessWidget {
  const CustomCheckAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0xffEDEDED),
      radius: 50,
      child: CircleAvatar(
        backgroundColor: Color(0xff34A853),
        radius: 40,
        child: Icon(
          Icons.check,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
