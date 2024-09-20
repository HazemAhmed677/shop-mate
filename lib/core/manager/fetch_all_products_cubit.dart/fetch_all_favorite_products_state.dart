part of 'fetch_all_favorite_products_cubit.dart';

sealed class FetchAllFavoriteProductsState {}

final class FetchAllFavoriteProductsInitial
    extends FetchAllFavoriteProductsState {}

class FetchAllFavoriteProductsSuccess extends FetchAllFavoriteProductsState {
  final List<ProductModel> productsList;

  FetchAllFavoriteProductsSuccess({required this.productsList});
}

class FetchAllFavoriteProductsFailure extends FetchAllFavoriteProductsState {
  final String errorMessege;
  FetchAllFavoriteProductsFailure(this.errorMessege);
}
