import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../constants.dart';
import 'fetch_search_box_state.dart';

class FetchSearchBoxCubit extends Cubit<FetchSearchBoxState> {
  FetchSearchBoxCubit() : super(FetchSearchBoxInitial());
  void fetchCartProducts() {
    try {
      var searchBox = Hive.box<String>(kSearchedProductsBox);
      var storedSearched = searchBox.values.toList();
      emit(
        FetchSearchBoxSuccess(searchedProductsList: storedSearched),
      );
    } catch (e) {
      emit(
        FetchSearchBoxFailure(e.toString()),
      );
    }
  }
}
