import 'package:bloc/bloc.dart';
import 'package:shop_mate/core/models/products_model/products_model.dart';
import 'package:shop_mate/features/search/data/repo/search_repo_impl.dart';
part 'fetch_searched_products_state.dart';

class FetchSearchedProductsCubit extends Cubit<FetchSearchedProductsState> {
  FetchSearchedProductsCubit({required this.searchRepoImpl})
      : super(FetchSaerchedProductsInitial());
  final SearchRepoImpl searchRepoImpl;
  Future<void> searchProducts({
    required String category,
  }) async {
    emit(FetchSaerchedProductsLoading());
    var response = await searchRepoImpl.search(
      category: category,
    );
    response.fold(
      (failure) {
        emit(FetchSaerchedProductsFailure('${failure.errorMsg} for $category'));
      },
      (productsModel) {
        emit(FetchSaerchedProductsSuccess(productsModel, category));
      },
    );
  }

  void resetToInitSate() {
    emit(FetchSaerchedProductsInitial());
  }
}
