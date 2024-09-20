part of 'add_product_cubit.dart';

sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {}

class AddToCartFailure extends AddToCartState {
  final String errorMessege;
  AddToCartFailure(this.errorMessege);
}
