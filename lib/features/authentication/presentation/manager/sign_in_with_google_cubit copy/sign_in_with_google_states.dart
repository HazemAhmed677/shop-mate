part of 'sign_in_with_google_cubit.dart';

sealed class SignInWithGoogleState {}

final class SignInWithGoogleInitial extends SignInWithGoogleState {}

final class SignInWithGoogleLoading extends SignInWithGoogleState {}

final class SignInWithGoogleBack extends SignInWithGoogleState {}

final class SignInWithGoogleSuccess extends SignInWithGoogleState {}

final class SignInWithGoogleFailure extends SignInWithGoogleState {
  final String errorMsg;
  SignInWithGoogleFailure({required this.errorMsg});
}
