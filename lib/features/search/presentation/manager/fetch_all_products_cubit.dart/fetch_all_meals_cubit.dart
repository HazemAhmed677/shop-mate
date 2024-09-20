import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/products_model/product_model.dart';
part 'fetch_all_meals_cubit_state.dart';

class FetchAllProductsCubit extends Cubit<FetchAllProductssCubitState> {
  FetchAllProductsCubit() : super(FetchAllProductsCubitInitial());
  void fetchAllProduct() {
    try {
      var productsBox = Hive.box<ProductModel>(kProductsBox);
      var storedProducts = productsBox.values.toList();
      emit(
        FetchAllProductsSuccess(productsList: storedProducts),
      );
    } catch (e) {
      emit(
        FetchAllProductsFailure(e.toString()),
      );
    }
  }
}
