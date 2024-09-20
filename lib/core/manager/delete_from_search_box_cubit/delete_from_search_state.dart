abstract class DeleteFromSearchState {}

final class DeleteFromSearchInitial extends DeleteFromSearchState {}

final class DeleteFromSearchSuccess extends DeleteFromSearchState {}

final class DeleteFromSearchFailure extends DeleteFromSearchState {
  final String errorMsg;

  DeleteFromSearchFailure(this.errorMsg);
}
