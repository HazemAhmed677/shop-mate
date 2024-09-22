part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFaliure extends SignUpState {
  final String errorMsg;
  SignUpFaliure({required this.errorMsg});
}
