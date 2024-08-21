import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
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
                  const EmailAndPasswordPart(),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomActionButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        autovalidateMode = AutovalidateMode.disabled;
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                      setState(() {});
                    },
                    text: 'Sign In',
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  const RowOfDividers(
                    text: 'Or sign in with',
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  const RowOfOptions(),
                  const SizedBox(
                    height: 48,
                  ),
                  DontHaveAccount(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(
                        AppRouters.register,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 28,
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
