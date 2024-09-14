import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/core/utils/app_routers.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/custom_actions_row.dart';

class MyCartItem extends StatefulWidget {
  const MyCartItem({super.key, this.bottomDivider = true});
  final bool bottomDivider;
  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItem> {
  int amount = 1;
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
              GoRouter.of(context).push(AppRouters.productDetails);
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
                          image: const DecorationImage(
                            image: AssetImage(AppImages.testImage),
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
                          'Brown Jacket',
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
                              'Size XL',
                              style: AppStyles.regular24
                                  .copyWith(fontSize: 16, color: Colors.grey),
                            ),
                            const CustomActionsRow()
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          r'$83.97',
                          style: AppStyles.semiBoldPoppins28.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        (widget.bottomDivider)
            ? Divider(
                height: 36,
                thickness: 1,
                color: Colors.grey.shade300,
              )
            : const SizedBox(
                height: 104,
              ),
      ],
    );
  }
}
