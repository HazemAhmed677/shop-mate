// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_in_states.dart';

class LoginCubit extends Cubit<SignInState> {
  LoginCubit() : super(SignInInitial());

  Future<void> userLogin(
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
        emit(SignInFaliure(errorMsg: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFaliure(errorMsg: 'Wrong password'));
      }
    } catch (e) {
      emit(SignInFaliure(errorMsg: 'somthing went wrong'));
    }
  }
}
