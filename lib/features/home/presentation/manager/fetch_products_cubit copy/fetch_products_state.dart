part of 'fetch_products_cubit.dart';

abstract class FetchProductsState {}

final class FetchProductsInitial extends FetchProductsState {}

final class FetchProductsLoading extends FetchProductsState {}

final class FetchProductsSuccess extends FetchProductsState {
  final ProductsModel productsModel;
  FetchProductsSuccess(this.productsModel);
}

final class FetchProductsFailure extends FetchProductsState {
  final String errorMsg;
  FetchProductsFailure(this.errorMsg);
}
