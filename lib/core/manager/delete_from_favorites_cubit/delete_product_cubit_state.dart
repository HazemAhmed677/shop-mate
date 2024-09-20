part of 'delete_product_cubit.dart';

sealed class DeleteFavoriteCubitState {}

final class DeleteProductCubitInitial extends DeleteFavoriteCubitState {}

final class DeleteProductSuccess extends DeleteFavoriteCubitState {}

final class DeleteProductFailure extends DeleteFavoriteCubitState {
  final String errorMsg;

  DeleteProductFailure(this.errorMsg);
}
