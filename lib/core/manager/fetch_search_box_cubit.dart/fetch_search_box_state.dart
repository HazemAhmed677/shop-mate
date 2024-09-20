abstract class FetchSearchBoxState {}

final class FetchSearchBoxInitial extends FetchSearchBoxState {}

class FetchSearchBoxSuccess extends FetchSearchBoxState {
  final List<String> searchedProductsList;

  FetchSearchBoxSuccess({required this.searchedProductsList});
}

class FetchSearchBoxFailure extends FetchSearchBoxState {
  final String errorMessege;
  FetchSearchBoxFailure(this.errorMessege);
}
