part of 'sign_up_with_email_cubit.dart';

abstract class SignUpWithEmailState {}

final class SignUpWithEmailInitial extends SignUpWithEmailState {}

final class SignUpWithEmailLoading extends SignUpWithEmailState {}

final class SignUpWithEmailSuccess extends SignUpWithEmailState {}

final class SignUpWithEmailFaliure extends SignUpWithEmailState {
  final String errorMsg;
  SignUpWithEmailFaliure({required this.errorMsg});
}
