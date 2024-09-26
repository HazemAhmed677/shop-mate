import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/core/widgets/custom_loading_bar.dart';
import 'package:shop_mate/core/widgets/show_snack_bar.dart';
import 'package:shop_mate/features/authentication/presentation/manager/sign_in_with_google_cubit%20copy/sign_in_with_google_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routers.dart';
import 'custom_sign_in_option.dart';

class RowOfOptions extends StatefulWidget {
  const RowOfOptions({super.key});

  @override
  State<RowOfOptions> createState() => _RowOfOptionsState();
}

class _RowOfOptionsState extends State<RowOfOptions> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to simulate loading animation
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 3; // Loop through the dots
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<SignInWithGoogleCubit, SignInWithGoogleState>(
          listener: (BuildContext context, SignInWithGoogleState state) {
            if (state is SignInWithGoogleFailure) {
              showSnackBar(context: context, e: state.errorMsg);
            } else if (state is SignInWithGoogleSuccess) {
              showSnackBar(
                  context: context,
                  e: 'Signed in with Google successfully',
                  flag: true);
              GoRouter.of(context).go(AppRouters.home);
            }
          },
          builder: (context, state) {
            if (state is SignInWithGoogleLoading) {
              return Center(
                child: SmoothIndicator(
                  offset: _currentIndex.toDouble(),
                  count: 4, // Number of dots
                  effect: const ScrollingDotsEffect(
                    activeDotColor: Colors.grey,
                    dotColor: AppColors.primaryColor,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                  size: const Size(8, 8),
                ),
              );
            }
            return CustomSignInOption(
              image: AppImages.gmail,
              onTap: () async {
                await BlocProvider.of<SignInWithGoogleCubit>(context)
                    .googleSignIn();
              },
            );
          },
        ),
        const SizedBox(
          width: 16,
        ),
        CustomSignInOption(
          image: AppImages.facebook,
          onTap: () {},
        )
      ],
    );
  }
}
