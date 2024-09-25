// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_in_states.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> userSignIn(
      {required String email, required String password}) async {
    emit(SignInLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        SignInSuccess(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure(errorMsg: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure(errorMsg: 'Wrong password'));
      }
    } catch (e) {
      print(e.toString());
      emit(
        SignInFailure(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}
