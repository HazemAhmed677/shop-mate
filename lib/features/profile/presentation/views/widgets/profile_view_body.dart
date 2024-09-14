import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            Text('Profile'),
          ],
        ),
      ),
    );
  }
}
