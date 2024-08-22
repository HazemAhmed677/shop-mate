import 'package:flutter/material.dart';
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
          slivers: [
            SliverToBoxAdapter(child: HomeViewHeaderSection()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 22,
              ),
            ),
            SliverToBoxAdapter(
              child: ,
            )
          ],
        ),
      ),
    );
  }
}
