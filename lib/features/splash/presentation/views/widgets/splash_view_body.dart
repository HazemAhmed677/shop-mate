import 'package:flutter/material.dart';
import 'package:shop_mate/features/splash/presentation/views/widgets/logo_with_name.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LogoWithName(),
    );
  }
}
