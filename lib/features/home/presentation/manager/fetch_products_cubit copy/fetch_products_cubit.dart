import 'package:bloc/bloc.dart';
import 'package:shop_mate/features/home/data/models/products_model/products_model.dart';
import 'package:shop_mate/features/home/data/repo/home_repo_impl.dart';
part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit({required this.homeRepoImplement})
      : super(FetchProductsInitial());
  final HomeRepoImpl homeRepoImplement;

  Future<void> fetchProducts({required String category}) async {
    emit(FetchProductsLoading());
    var response = await homeRepoImplement.getProducts(category: category);
    response.fold((failure) {
      emit(FetchProductsFailure(failure.errorMsg));
    }, (productsModel) {
      emit(FetchProductsSuccess(productsModel));
    });
  }
}
