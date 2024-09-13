import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/core/utils/app_images.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_details_icon.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(AppImages.testImage),
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
                    size: 26,
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
                          size: 26,
                        )
                      : const Icon(
                          IconlyBold.heart,
                          color: Colors.black,
                          size: 26,
                        ),
                ),
              )
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 22,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 22,
          ),
        ),
      ],
    );
  }
}
