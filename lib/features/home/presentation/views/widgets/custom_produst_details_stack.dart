import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_details_icon.dart';

import '../../../../../constants.dart';
import '../../../../../core/manager/add_to_favorites_cubit/add_product_cubit.dart';
import '../../../../../core/manager/delete_from_favorites_cubit/delete_product_cubit.dart';
import '../../../../../core/manager/fetch_favorites_cubit.dart/fetch_all_favorite_products_cubit.dart';

class CustomProdustDetailsStack extends StatefulWidget {
  const CustomProdustDetailsStack({super.key, required this.product});
  final ProductModel product;
  @override
  State<CustomProdustDetailsStack> createState() =>
      _CustomProdustDetailsStackState();
}

class _CustomProdustDetailsStackState extends State<CustomProdustDetailsStack> {
  late Box<ProductModel> box;
  late ProductModel? product;
  @override
  Widget build(BuildContext context) {
    box = Hive.box<ProductModel>(kFavoritesBox);
    product = box.get(widget.product.id);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Stack(
        children: [
          Positioned(
            right: 26,
            left: 26,
            bottom: 0,
            top: 22,
            child: CachedNetworkImage(
              imageUrl: widget.product.image!,
              errorWidget: (_, __, ___) => const Icon(
                IconlyLight.image,
              ),
            ),
          ),
          Positioned(
            left: 26,
            top: 22,
            child: CustomDetailsIcon(
              onTap: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                IconlyLight.arrow_left,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          Positioned(
            right: 26,
            top: 22,
            child: CustomDetailsIcon(
              onTap: () async {
                try {
                  if (product == null) {
                    await BlocProvider.of<AddToFavoriteCubit>(context)
                        .addProduct(productModle: widget.product);

                    BlocProvider.of<FetchAllFavoriteProductsCubit>(context)
                        .fetchAllProduct();
                  } else {
                    await BlocProvider.of<DeleteFromFavoriteCubit>(context)
                        .deleteProduct(productModel: widget.product);

                    BlocProvider.of<FetchAllFavoriteProductsCubit>(context)
                        .fetchAllProduct();
                  }
                } catch (e) {
                  //
                }
                setState(
                  () {},
                );
                setState(
                  () {},
                );
              },
              icon: (product == null)
                  ? const Icon(
                      IconlyLight.heart,
                      color: Colors.black,
                      size: 28,
                    )
                  : const Icon(
                      IconlyBold.heart,
                      color: Colors.black,
                      size: 28,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
