import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_category_types.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/flash_sale_row.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/home_view_header_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverToBoxAdapter(child: HomeViewHeaderSection()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 22,
              ),
            ),
            // changable
            SliverToBoxAdapter(
              child: CustomCategoryTypesSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 22,
              ),
            ),
            SliverToBoxAdapter(
              child: FlashSaleRow(),
            ),
          ],
        ),
      ),
    );
  }
}
