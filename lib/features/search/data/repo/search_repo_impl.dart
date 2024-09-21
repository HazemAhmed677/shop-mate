import 'package:dartz/dartz.dart';
import 'package:shop_mate/core/errors/failure_class.dart';
import 'package:shop_mate/core/models/products_model/products_model.dart';
import 'package:shop_mate/core/utils/api_class.dart';
import 'package:shop_mate/features/search/data/repo/search_repo.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiClass apiClass;
  SearchRepoImpl({required this.apiClass});
  @override
  Future<Either<FailureService, ProductsModel>> search(
      {required String category}) async {
    try {
      ProductsModel productsModel =
          await apiClass.getProductsOfACategory(category: category);
      return right(productsModel);
    } on DioException catch (e) {
      return left(
        FailureService.fromDioException(
          dioExecption: e.type,
          statusCode: e.response?.statusCode ?? 400,
        ),
      );
    } catch (e) {
      return left(
        FailureService(e.toString()),
      );
    }
  }
}
