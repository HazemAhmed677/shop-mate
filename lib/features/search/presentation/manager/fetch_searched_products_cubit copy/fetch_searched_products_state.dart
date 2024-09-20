part of 'fetch_searched_products_cubit.dart';

abstract class FetchSearchedProductsState {}

final class FetchSaerchedProductsInitial extends FetchSearchedProductsState {}

final class FetchSaerchedProductsLoading extends FetchSearchedProductsState {}

final class FetchSaerchedProductsSuccess extends FetchSearchedProductsState {
  final ProductsModel productsModel;
  final String searchedWord;
  FetchSaerchedProductsSuccess(this.productsModel, this.searchedWord);
}

final class FetchSaerchedProductsFailure extends FetchSearchedProductsState {
  final String errorMsg;
  FetchSaerchedProductsFailure(this.errorMsg);
}
