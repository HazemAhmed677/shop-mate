import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../constants.dart';
import '../../models/products_model/product_model.dart';
part 'fetch_cart_products_state.dart';

class FetchCartProductsCubit extends Cubit<FetchCartProductsState> {
  FetchCartProductsCubit() : super(FetchCartProductsInitial());
  void fetchCartProducts() {
    try {
      var productsBox = Hive.box<ProductModel>(kCartBox);
      var storedProducts = productsBox.values.toList();
      emit(
        FetchCartProductsSuccess(productsList: storedProducts),
      );
    } catch (e) {
      emit(
        FetchCartProductsFailure(e.toString()),
      );
    }
  }
}
