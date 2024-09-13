import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_styles.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/color_list_view.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/product_details_column_top_section.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/size_list_view.dart';

class CustomProductDetailsColumn extends StatelessWidget {
  const CustomProductDetailsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductDetailsColumnTopSection(),
          Divider(
            height: 50,
            thickness: 1,
            color: Colors.grey.withOpacity(0.9),
          ),
          Text(
            'Select Size',
            style: AppStyles.semiBoldInter16.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizeListView(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                'Select Color : ',
                style: AppStyles.semiBoldInter16.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Brown',
                style: AppStyles.semiBoldInter16.copyWith(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const ColorListView(),
        ],
      ),
    );
  }
}
