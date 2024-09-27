// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'sign_in_with_google_states.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit() : super(SignInWithGoogleInitial());
  Future googleSignIn() async {
    try {
      emit(SignInWithGoogleLoading());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(SignInWithGoogleBack());
        return;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(SignInWithGoogleSuccess());
    } catch (e) {
      emit(
        SignInWithGoogleFailure(
          errorMsg: e.toString(),
        ),
      );
      print(e.toString());
    }
  }
}
