import 'package:flutter/material.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: WelcomeViewBody(),
    );
  }
}
