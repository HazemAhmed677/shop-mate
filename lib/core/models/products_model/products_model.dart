import 'product.dart';

class ProductsModel {
  String? status;
  String? message;
  List<Product>? products;

  ProductsModel({this.status, this.message, this.products});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        status: json['status'] as String?,
        message: json['message'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
