part of 'fetch_cart_products_cubit.dart';

sealed class FetchCartProductsState {}

final class FetchAllFavoriteProductsInitial extends FetchCartProductsState {}

class FetchCartProductsSuccess extends FetchCartProductsState {
  final List<ProductModel> productsList;

  FetchCartProductsSuccess({required this.productsList});
}

class FetchCartProductsFailure extends FetchCartProductsState {
  final String errorMessege;
  FetchCartProductsFailure(this.errorMessege);
}
