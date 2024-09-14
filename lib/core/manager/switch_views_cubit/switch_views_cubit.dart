import 'package:bloc/bloc.dart';
part 'switch_views_state.dart';

class SwitchViewsCubit extends Cubit<SwitchViewsState> {
  SwitchViewsCubit() : super(HomeViewState());
  setIndex(int currentIndex) {
    if (currentIndex == 0) {
      emit(HomeViewState());
    } else if (currentIndex == 1) {
      emit(CartViewState());
    } else if (currentIndex == 2) {
      emit(FavoriteViewState());
    } else if (currentIndex == 3) {
      emit(SearchViewState());
    } else {
      emit(ProfileViewState());
    }
  }
}
