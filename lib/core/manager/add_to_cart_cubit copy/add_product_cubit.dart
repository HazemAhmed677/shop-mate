// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../constants.dart';
import '../../models/products_model/product_model.dart';
part 'add_product_cubit_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddProductInitial());
  Future<void> addProduct({required ProductModel productModle}) async {
    try {
      var productsBox = Hive.box<ProductModel>(kCartBox);
      int id = productModle.id!;
      await productsBox.put(id, productModle);
      emit(AddProudctSuccess());
    } catch (e) {
      emit(
        AddProductFailure(
          e.toString(),
        ),
      );
    }
  }
}
