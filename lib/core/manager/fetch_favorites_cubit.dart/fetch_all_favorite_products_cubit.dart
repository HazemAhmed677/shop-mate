import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../constants.dart';
import '../../models/products_model/product_model.dart';
part 'fetch_all_favorite_products_state.dart';

class FetchAllFavoriteProductsCubit
    extends Cubit<FetchAllFavoriteProductsState> {
  FetchAllFavoriteProductsCubit() : super(FetchAllFavoriteProductsInitial());
  void fetchAllProduct() {
    try {
      var productsBox = Hive.box<ProductModel>(kFavoritesBox);
      var storedProducts = productsBox.values.toList();
      emit(
        FetchAllFavoriteProductsSuccess(productsList: storedProducts),
      );
    } catch (e) {
      emit(
        FetchAllFavoriteProductsFailure(e.toString()),
      );
    }
  }
}
