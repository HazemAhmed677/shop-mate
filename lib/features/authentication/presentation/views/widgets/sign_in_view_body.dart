import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_mate/core/widgets/show_snack_bar.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_sign_in_option.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_sub_middle_section.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_in_bottom_section.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_in_top_section.dart';
import '../../../../../core/manager/switch_views_cubit/switch_views_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../manager/sign_in_with_google_cubit copy/sign_in_with_google_cubit.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  int _currentIndex = 0;
  Timer? _timer;
  bool isAsync = false;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 3; // Loop through the dots
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.4,
      inAsyncCall: isAsync,
      progressIndicator: const CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
              ),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: const SignInTopSection()),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: SizedBox(
                            height: 32,
                          ),
                        ),
                        const Expanded(
                          child: CustomSubMiddleSection(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocConsumer<SignInWithGoogleCubit,
                                SignInWithGoogleState>(
                              listener: (BuildContext context,
                                  SignInWithGoogleState state) {
                                if (state is SignInWithGoogleFailure) {
                                  isAsync = false;
                                  showSnackBar(
                                      context: context, e: state.errorMsg);
                                } else if (state is SignInWithGoogleSuccess) {
                                  isAsync = false;
                                  showSnackBar(
                                      context: context,
                                      e: 'Signed in with Google successfully',
                                      flag: true);
                                  GoRouter.of(context).go(AppRouters.home);
                                } else if (state is SignInWithGoogleLoading) {
                                  isAsync = true;
                                } else if (state is SignInWithGoogleBack) {
                                  isAsync = false;
                                }
                                setState(() {});
                              },
                              builder: (context, state) {
                                return CircleAvatar(
                                  radius: 22,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          32,
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade400,
                                        )),
                                    child: CustomSignInOption(
                                      image: AppImages.gmail,
                                      onTap: () async {
                                        BlocProvider.of<SwitchViewsCubit>(
                                                context)
                                            .setIndex(0);

                                        await BlocProvider.of<
                                                SignInWithGoogleCubit>(context)
                                            .googleSignIn();
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            CustomSignInOption(
                              image: AppImages.facebook,
                              onTap: () {},
                            )
                          ],
                        ),
                        const Expanded(
                          flex: 4,
                          child: SignInBottomSection(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
