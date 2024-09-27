import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/thank_view_body.dart';

import '../../../../core/helpers/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        onTap: () {
          context.pop();
        },
      ),
      body: ThankViewBody(
        productModel: productModel,
      ),
    );
  }
}
