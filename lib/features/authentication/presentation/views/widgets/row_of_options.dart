import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowOfOptions extends StatelessWidget {
  const RowOfOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(
            12,
          ),
          onTap: () async {
            await signInWithGoogle();
          },
          child: SizedBox(
            height: 42,
            width: 46,
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: SvgPicture.asset(
                  AppImages.gmail,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(
            12,
          ),
          onTap: () {},
          child: SizedBox(
            height: 42,
            width: 46,
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: SvgPicture.asset(
                  AppImages.facebook,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
