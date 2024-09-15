import 'package:dartz/dartz.dart';
import 'package:shop_mate/features/home/data/models/categories_model.dart';

import '../../../../core/errors/failure_class.dart';

abstract class HomeRepo {
  Future<Either<FailureService, CategoriesModel>> getAllCategories();
}
