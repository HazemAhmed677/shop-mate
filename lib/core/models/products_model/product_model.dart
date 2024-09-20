import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(
  typeId: 0,
)
class ProductModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? image;
  @HiveField(3)
  int? price;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String? brand;
  @HiveField(6)
  String? model;
  String? color;
  @HiveField(7)
  String? category;
  int? discount;
  bool? onSale;
  bool? popular;
  ProductModel({
    this.id,
    this.title,
    this.image,
    this.price,
    this.description,
    this.brand,
    this.model,
    this.color,
    this.category,
    this.discount,
    this.onSale,
    this.popular,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        image: json['image'] as String?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        brand: json['brand'] as String?,
        model: json['model'] as String?,
        color: json['color'] as String?,
        category: json['category'] as String?,
        discount: json['discount'] as int?,
        onSale: json['onSale'] as bool?,
        popular: json['popular'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'price': price,
        'description': description,
        'brand': brand,
        'model': model,
        'color': color,
        'category': category,
        'discount': discount,
        'onSale': onSale,
        'popular': popular,
      };
}
