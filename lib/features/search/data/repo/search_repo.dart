import 'package:dartz/dartz.dart';
import 'package:shop_mate/core/errors/failure_class.dart';
import 'package:shop_mate/core/models/products_model/products_model.dart';

abstract class SearchRepo {
  Future<Either<FailureService, ProductsModel>> search(
      {required String category});
}
