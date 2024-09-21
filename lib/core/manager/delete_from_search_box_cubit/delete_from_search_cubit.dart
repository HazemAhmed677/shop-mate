// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../constants.dart';
import 'delete_from_search_state.dart';

class DeleteFromSearchCubit extends Cubit<DeleteFromSearchState> {
  DeleteFromSearchCubit() : super(DeleteFromSearchInitial());
  var saerchBox = Hive.box<String>(kSearchedProductsBox);
  Future<void> deleteFromSearch({required String searchedProduct}) async {
    try {
      await saerchBox.delete(searchedProduct);

      emit(DeleteFromSearchSuccess());
    } catch (e) {
      emit(
        DeleteFromSearchFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<void> clearAll() async {
    try {
      await saerchBox.clear();
      emit(DeleteFromSearchSuccess());
    } catch (e) {
      emit(
        DeleteFromSearchFailure(
          e.toString(),
        ),
      );
    }
  }
}
