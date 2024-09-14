import 'package:bloc/bloc.dart';
part 'switch_views_state.dart';

class SwitchViewsCubit extends Cubit<SwitchViewsState> {
  SwitchViewsCubit() : super(HomeViewState());
  int index = 0;
  setIndex(int currentIndex) {
    if (currentIndex == 0) {
      index = 0;
      emit(HomeViewState());
    } else if (currentIndex == 1) {
      index = 1;
      emit(CartViewState());
    } else if (currentIndex == 2) {
      index = 2;
      emit(FavoriteViewState());
    } else if (currentIndex == 3) {
      index = 3;
      emit(SearchViewState());
    } else {
      index = 4;
      emit(ProfileViewState());
    }
  }
}
