part of 'delete_product_cubit.dart';

sealed class DeleteCartCubitState {}

final class DeleteFromCartCubitInitial extends DeleteCartCubitState {}

final class DeleteFromCartCubitSuccess extends DeleteCartCubitState {}

final class DeleteFromCartCubitFailure extends DeleteCartCubitState {
  final String errorMsg;

  DeleteFromCartCubitFailure(this.errorMsg);
}
