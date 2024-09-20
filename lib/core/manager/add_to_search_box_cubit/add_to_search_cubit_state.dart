part of 'add_to_search_cubit.dart';

sealed class AddToSearchCubitState {}

final class AddToSearchInitial extends AddToSearchCubitState {}

class AddToSearchSuccess extends AddToSearchCubitState {}

class AddToSearchFailure extends AddToSearchCubitState {
  final String errorMessege;
  AddToSearchFailure(this.errorMessege);
}
