import 'package:flutter/material.dart';
import 'package:shop_mate/features/profile/presentation/views/widgets/profile_view_body.dart';
import '../../../../core/utils/app_colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  double opacity = 0.0; // Initial opacity is 0 (invisible)

  @override
  void initState() {
    super.initState();
    // Trigger the fade-in effect after a short delay
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0; // Set opacity to 1 (fully visible)
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 210),
        child: const ProfileViewBody(),
      ),
    );
  }
}
