part of 'delete_product_cubit.dart';

sealed class DeleteCartCubitState {}

final class DeleteProductCubitInitial extends DeleteCartCubitState {}

final class DeleteProductSuccess extends DeleteCartCubitState {}

final class DeleteProductFailure extends DeleteCartCubitState {
  final String errorMsg;

  DeleteProductFailure(this.errorMsg);
}
