import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/core/widgets/product_details_body.dart';
import '../models/wrapper_product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.wrapperProductModel});
  final WrapperProductModel wrapperProductModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ProductDetailsViewBody(
        product: wrapperProductModel.product,
        isCheckout: wrapperProductModel.isCheckout,
      ),
    );
  }
}
