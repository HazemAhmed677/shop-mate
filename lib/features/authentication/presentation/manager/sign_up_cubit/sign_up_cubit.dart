// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> userRegister(
      {required String email, required String password}) async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFaliure(errorMsg: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFaliure(
            errorMsg: 'The account already exists for that email'));
      } else {
        emit(
          SignUpFaliure(errorMsg: 'Email is not valid!.'),
        );
      }
    } catch (e) {
      emit(SignUpFaliure(errorMsg: 'somthing went wrong'));
    }
  }
}
