part of 'add_product_cubit.dart';

sealed class AddToCartState {}

final class AddProductInitial extends AddToCartState {}

class AddProudctSuccess extends AddToCartState {}

class AddProductFailure extends AddToCartState {
  final String errorMessege;
  AddProductFailure(this.errorMessege);
}
