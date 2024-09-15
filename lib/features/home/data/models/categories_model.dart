class CategoriesModel {
  String? status;
  String? message;
  List<String>? categories;

  CategoriesModel({this.status, this.message, this.categories});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      categories: json['categories'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'categories': categories,
      };
}
