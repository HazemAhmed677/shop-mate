part of 'fetch_all_categories_cubit.dart';

abstract class FetchAllCategoriesState {}

final class FetchAllCategoriesInitial extends FetchAllCategoriesState {}

final class FetchAllCategoriesLoading extends FetchAllCategoriesState {}

final class FetchAllCategoriesSuccess extends FetchAllCategoriesState {
  final CategoriesModel categoriesModel;
  FetchAllCategoriesSuccess(this.categoriesModel);
}

final class FetchAllCategoriesFailure extends FetchAllCategoriesState {
  final String errorMsg;
  FetchAllCategoriesFailure(this.errorMsg);
}
