// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_with_email_states.dart';

class SignUpWithEmailCubit extends Cubit<SignUpWithEmailState> {
  SignUpWithEmailCubit() : super(SignUpWithEmailInitial());
  File? profileImage;
  Future<void> userRegister(
      {required String email,
      required String password,
      required String name}) async {
    try {
      emit(SignUpWithEmailLoading());
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // After creating the user, update their profile with the display name and photo URL
      await userCredential.user!.updateProfile(
        displayName: name,
      );
      if (profileImage != null) {
        await userCredential.user!.updatePhotoURL(profileImage!.path);
      }
      emit(SignUpWithEmailSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpWithEmailFaliure(
            errorMsg: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpWithEmailFaliure(
            errorMsg: 'The account already exists for that email'));
      } else {
        emit(
          SignUpWithEmailFaliure(errorMsg: 'Email is not valid!.'),
        );
      }
    } catch (e) {
      emit(SignUpWithEmailFaliure(errorMsg: 'somthing went wrong'));
    }
  }
}
