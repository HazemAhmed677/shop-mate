import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/home/presentation/views/home_view.dart';
import 'package:shop_mate/features/splash/presentation/views/splash_view.dart';
import '../../../../core/widgets/show_snack_bar.dart';

class StreamingView extends StatelessWidget {
  const StreamingView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const ModalProgressHUD(
              inAsyncCall: true,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          if (snapshot.hasError) {
            showSnackBar(context: context, e: 'Oops, there somthing wrong');
          }
          if (snapshot.data == null) {
            return const SplashView();
          } else {
            return const HomeView();
          }
        });
  }
}
