// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../constants.dart';
part 'add_to_search_cubit_state.dart';

class AddToSearchCubit extends Cubit<AddToSearchCubitState> {
  AddToSearchCubit() : super(AddToSearchInitial());
  Future<void> addToCart({required String searchedProduct}) async {
    try {
      var saerchBox = Hive.box<String>(kSearchedProductsBox);
      await saerchBox.add(searchedProduct);
      emit(AddToSearchSuccess());
    } catch (e) {
      emit(
        AddToSearchFailure(
          e.toString(),
        ),
      );
    }
  }
}
