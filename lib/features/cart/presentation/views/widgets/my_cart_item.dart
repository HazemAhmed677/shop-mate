import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/helpers/captalize_the_first_letter.dart';
import 'package:shop_mate/core/models/products_model/product_model.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/custom_actions_row.dart';

class MyCartItem extends StatelessWidget {
  const MyCartItem({
    super.key,
    required this.product,
    this.bottomDivider = true,
  });
  final ProductModel product;
  final bool bottomDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(
              14,
            ),
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouters.productDetails, extra: product);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: 14.0,
                left: 4,
                top: 4,
                bottom: 4,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          image: DecorationImage(
                            image: (product.image == null)
                                ? const AssetImage(AppImages.testImage)
                                : CachedNetworkImageProvider(product.image!),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.semiBoldPoppins28.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.brand != null
                                  ? capitalizeFirstLetter(product.brand!)
                                  : "",
                              style: AppStyles.semiBoldPoppins28.copyWith(
                                fontSize: 16,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const CustomActionsRow()
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              r'$',
                              style: AppStyles.semiBoldPoppins28.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            (product.price == null)
                                ? const SizedBox()
                                : Text(
                                    product.price.toString(),
                                    style: AppStyles.semiBoldPoppins28.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        (bottomDivider)
            ? Divider(
                height: 24,
                thickness: 1,
                color: Colors.grey.shade300,
              )
            : const SizedBox(),
      ],
    );
  }
}
