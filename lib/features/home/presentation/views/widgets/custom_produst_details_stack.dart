import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/core/models/products_model/product.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_details_icon.dart';

class CustomProdustDetailsStack extends StatefulWidget {
  const CustomProdustDetailsStack({super.key, required this.product});
  final Product product;
  @override
  State<CustomProdustDetailsStack> createState() =>
      _CustomProdustDetailsStackState();
}

class _CustomProdustDetailsStackState extends State<CustomProdustDetailsStack> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: CachedNetworkImage(
          imageUrl: widget.product.image!,
          errorWidget: (_, __, ___) => const Icon(
            IconlyLight.image,
          ),
        )),
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
            onTap: () {
              flag = !flag;
              setState(
                () {},
              );
            },
            icon: (!flag)
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
    );
  }
}
