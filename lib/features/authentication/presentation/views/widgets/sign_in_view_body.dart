import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/widgets/custom_loading_bar.dart';
import 'package:shop_mate/core/widgets/show_snack_bar.dart';
import 'package:shop_mate/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/dont_have_account.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/email_and_password_part.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/row_of_dividers.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/row_of_options.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_word.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/widgets/custom_action_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26.0,
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  autovalidateMode: autovalidateMode,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SignWord(
                        title: 'Sign In',
                        subTitle: r"Hi! Welcome Back, you've been missed",
                        height: MediaQuery.sizeOf(context).height * 0.1,
                      ),
                      const SizedBox(
                        height: 52,
                      ),
                      EmailAndPasswordPart(
                        onChanged1: (value) {
                          email = value;
                        },
                        onChanged2: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      BlocConsumer<SignInCubit, SignInState>(
                        builder: (context, state) {
                          if (state is SignInLoading) {
                            return const CustomLoadingBar();
                          } else if (state is SignInInitial) {
                            return CustomActionButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  autovalidateMode = AutovalidateMode.disabled;
                                  print('email: $email, password: $password');
                                  await BlocProvider.of<SignInCubit>(context)
                                      .userSignIn(
                                          email: email, password: password);
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                }
                                setState(() {});
                              },
                              text: 'Sign In',
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                        listener: (BuildContext context, SignInState state) {
                          if (state is SignInSuccess) {
                            showSnackBar(context, 'Signed in successfully');
                            GoRouter.of(context).go(AppRouters.home);
                          } else if (state is SignInFailure) {
                            showSnackBar(context, state.errorMsg);
                          }
                        },
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 32,
                        ),
                      ),
                      const RowOfDividers(
                        text: 'Or sign in with',
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 32,
                        ),
                      ),
                      const RowOfOptions(),
                      const Expanded(
                        child: SizedBox(
                          height: 32,
                        ),
                      ),
                      DontHaveAccount(
                        onTap: () {
                          GoRouter.of(context).go(
                            AppRouters.signUp,
                          );
                        },
                      ),
                      const Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
