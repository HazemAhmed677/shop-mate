import 'package:flutter/material.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/email_and_password_part.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_in_word.dart';

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
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignInWord(),
              EmailAndPasswordPart(),
            ],
          ),
        ),
      ),
    );
  }
}
