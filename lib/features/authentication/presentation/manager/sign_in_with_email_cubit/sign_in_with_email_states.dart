part of 'sign_in_with_email_cubit.dart';

sealed class SignInWithEmailState {}

final class SignInWithEmailInitial extends SignInWithEmailState {}

final class SignInWithEmailLoading extends SignInWithEmailState {}

final class SignInWithEmailSuccess extends SignInWithEmailState {}

final class SignInWithEmailFailure extends SignInWithEmailState {
  final String errorMsg;
  SignInWithEmailFailure({required this.errorMsg});
}
