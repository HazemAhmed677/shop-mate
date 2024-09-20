import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_mate/constants.dart';
import 'package:shop_mate/core/manager/add_to_cart_cubit%20copy/add_product_cubit.dart';
import 'package:shop_mate/core/manager/delete_from_cart_cubit%20copy/delete_product_cubit.dart';
import 'package:shop_mate/core/manager/fetch_cart_cubit.dart%20copy/fetch_cart_products_cubit.dart';
import '../../../../../core/models/products_model/product_model.dart';
import 'add_to_cart.dart';
import 'remove_from_cart.dart';

class CustomSwitchBottomBottons extends StatefulWidget {
  const CustomSwitchBottomBottons({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  State<CustomSwitchBottomBottons> createState() =>
      _CustomSwitchBottomBottonsState();
}

class _CustomSwitchBottomBottonsState extends State<CustomSwitchBottomBottons> {
  late Box<ProductModel> box;
  late ProductModel? product;
  @override
  Widget build(BuildContext context) {
    box = Hive.box<ProductModel>(kCartBox);
    product = box.get(widget.product.id);
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 300,
      ), // Animation duration
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
            scale: animation, child: child); // Animation effect
      },
      child: (product != null)
          ? RemoveFromCart(
              onPressed: () async {
                try {
                  await BlocProvider.of<DeleteFromCartCubit>(context)
                      .deleteProduct(productModel: widget.product);
                  BlocProvider.of<FetchCartProductsCubit>(context)
                      .fetchAllProduct();
                  print('x98hiu');
                } catch (e) {
                  //
                }
                setState(
                  () {},
                );
              },
            )
          : AddToCart(
              onPressed: () async {
                try {
                  await BlocProvider.of<AddToCartCubit>(context)
                      .addProduct(productModle: widget.product);

                  BlocProvider.of<FetchCartProductsCubit>(context)
                      .fetchAllProduct();
                  print('delete');
                } catch (e) {
                  //
                }
                setState(
                  () {},
                );
              },
            ),
    );
  }
}
