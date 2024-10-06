import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/grid_view_item_bottom_section.dart';
import '../../../../../constants.dart';
import '../../../../../core/models/wrapper_product_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/manager/add_to_favorites_cubit/add_product_cubit.dart';
import '../../../../../core/manager/delete_from_favorites_cubit/delete_product_cubit.dart';
import '../../../../../core/manager/fetch_favorites_cubit.dart/fetch_all_favorite_products_cubit.dart';
import '../../../../../core/utils/app_routers.dart';

class GridViewItem extends StatefulWidget {
  const GridViewItem({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  late Box<ProductModel> box;
  late ProductModel? product;
  // @override
  // void initState() {
  //   BlocProvider.of<FetchAllFavoriteProductsCubit>(context).fetchAllProduct();
  //   box = Hive.box<ProductModel>(kFavoritesBox);
  //   product = box.get(widget.product.id);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    box = Hive.box<ProductModel>(kFavoritesBox);
    BlocProvider.of<FetchAllFavoriteProductsCubit>(context).fetchAllProduct();
    product = box.get(widget.product.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: (widget.product.image == null)
                          ? const AssetImage(AppImages.noImage)
                          : CachedNetworkImageProvider(
                              widget.product.image!,
                            ),
                    ),
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.primaryColor.withOpacity(
                  0.1,
                ),
                child: IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  highlightColor: AppColors.white.withOpacity(
                    0.4,
                  ),
                  hoverColor: AppColors.white.withOpacity(
                    0.2,
                  ),
                  onPressed: () async {
                    try {
                      if (product == null) {
                        await BlocProvider.of<AddToFavoriteCubit>(context)
                            .addProduct(productModle: widget.product);

                        if (context.mounted) {
                          BlocProvider.of<FetchAllFavoriteProductsCubit>(
                                  context)
                              .fetchAllProduct();
                        }
                      } else {
                        await BlocProvider.of<DeleteFromFavoriteCubit>(context)
                            .deleteProduct(productModel: widget.product);

                        if (context.mounted) {
                          BlocProvider.of<FetchAllFavoriteProductsCubit>(
                                  context)
                              .fetchAllProduct();
                        }
                      }
                      setState(() {});
                    } catch (e) {
                      //
                    }
                  },
                  icon: Icon(
                    (product == null) ? IconlyLight.heart : IconlyBold.heart,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          borderRadius: BorderRadius.circular(
            12,
          ),
          onTap: () {
            WrapperProductModel wrapperProductModel = WrapperProductModel(
              product: widget.product,
            );
            context
                .push(
                  AppRouters.productDetails,
                  extra: wrapperProductModel,
                )
                .then((_) => setState(() {}));
          },
          child: GridViewItemBottomSection(
            product: widget.product,
          ),
        ),
      ],
    );
  }
}
