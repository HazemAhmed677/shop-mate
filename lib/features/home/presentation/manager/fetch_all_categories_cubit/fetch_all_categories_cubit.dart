import 'package:bloc/bloc.dart';
import 'package:shop_mate/features/home/data/models/categories_model.dart';
import 'package:shop_mate/features/home/data/repo/home_repo_impl.dart';
part 'fetch_all_categories_state.dart';

class FetchAllCategoriesCubit extends Cubit<FetchAllCategoriesState> {
  FetchAllCategoriesCubit({required this.homeRepoImplement})
      : super(FetchAllCategoriesInitial());
  final HomeRepoImpl homeRepoImplement;

  Future<void> fetchRecentSearchMeals() async {
    emit(FetchAllCategoriesLoading());
    var response = await homeRepoImplement.getAllCategories();
    response.fold((failure) {
      emit(FetchAllCategoriesFailure(failure.errorMsg));
    }, (categoriesModel) {
      emit(FetchAllCategoriesSuccess(categoriesModel));
    });
  }
}
