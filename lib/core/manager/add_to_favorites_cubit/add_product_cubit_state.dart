part of 'add_product_cubit.dart';

sealed class AddToFavorite {}

final class AddProductInitial extends AddToFavorite {}

class AddProudctSuccess extends AddToFavorite {}

class AddProductFailure extends AddToFavorite {
  final String errorMessege;
  AddProductFailure(this.errorMessege);
}
