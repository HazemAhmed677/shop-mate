import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_rate_widget.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/manager/add_product_cubit/add_product_cubit.dart';
import '../../../../../core/manager/delete_product_cubit/delete_product_cubit.dart';
import '../../../../../core/manager/fetch_all_products_cubit.dart/fetch_all_favorite_products_cubit.dart';

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
  @override
  Widget build(BuildContext context) {
    box = Hive.box<ProductModel>(kProductsBox);
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
                        await BlocProvider.of<AddProductCubit>(context)
                            .addProduct(productModle: widget.product);

                        BlocProvider.of<FetchAllFavoriteProductsCubit>(context)
                            .fetchAllProduct();
                      } else {
                        await BlocProvider.of<DeleteProductCubit>(context)
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
            context
                .push(
                  AppRouters.productDetails,
                  extra: widget.product,
                )
                .then((_) => setState(() {}));
          },
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 104,
                      ),
                      child: Text(
                        widget.product.title!,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regular24.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const CustomRateWidget(
                      width: 2,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Row(
                  children: [
                    Text(
                      r"$",
                      style: AppStyles.semiBoldPoppins28.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "${widget.product.price}",
                      style: AppStyles.semiBoldPoppins28.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
