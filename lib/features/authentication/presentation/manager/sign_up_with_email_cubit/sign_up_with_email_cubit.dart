// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      CollectionReference usernames =
          FirebaseFirestore.instance.collection('usernames');
      try {
        // Add user data to Firestore under the user ID
        await usernames.doc(FirebaseAuth.instance.currentUser!.uid).set({
          'name': name, // optional: store timestamp
        });

        print('User data added to Firestore successfully');
      } catch (e) {
        print('Error storing user data in Firestore: $e');
      }

      if (profileImage != null) {
        // storage cloud part
        try {
          final storageRef = FirebaseStorage.instance
              .ref()
              .child('user_profiles')
              .child('profile_${FirebaseAuth.instance.currentUser!.uid}.jpg');

          // Upload the image to Firebase Storage
          UploadTask uploadTask = storageRef.putFile(profileImage!);

          TaskSnapshot storageSnapshot = await uploadTask;
          String downloadUrl = await storageSnapshot.ref.getDownloadURL();
          // Update user's profile with the new photo URL
          await FirebaseAuth.instance.currentUser!
              .updateProfile(photoURL: downloadUrl);
        } catch (e) {
          //
        }
      }
      await FirebaseAuth.instance.currentUser?.reload();
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
