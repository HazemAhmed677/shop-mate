import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import '../../../constants.dart';
import '../../models/products_model/product_model.dart';

part 'delete_product_cubit_state.dart';

class DeleteFromCartCubit extends Cubit<DeleteCartCubitState> {
  DeleteFromCartCubit() : super(DeleteProductCubitInitial());

  Future<void> deleteProduct({
    required ProductModel productModel,
  }) async {
    try {
      var productsBox = Hive.box<ProductModel>(kCartBox);
      await productsBox.delete(productModel.id);
      emit(DeleteProductSuccess());
    } catch (e) {
      emit(
        DeleteProductFailure(
          e.toString(),
        ),
      );
    }
  }
}
