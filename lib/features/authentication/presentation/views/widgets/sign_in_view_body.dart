import 'package:flutter/material.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/dont_have_account.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/email_and_password_part.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/row_of_dividers.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/row_of_options.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_word.dart';

import '../../../../../core/widgets/custom_action_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  onPressed: () {},
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
                const DontHaveAccount(),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
