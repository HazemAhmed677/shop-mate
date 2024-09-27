import 'package:shop_mate/core/models/products_model/product_model.dart';

class WrapperProductModel {
  final ProductModel product;
  final bool isCheckout;
  WrapperProductModel({required this.product, this.isCheckout = false});
}
