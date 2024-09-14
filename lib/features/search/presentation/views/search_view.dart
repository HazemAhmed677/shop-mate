import 'package:flutter/material.dart';
import 'package:shop_mate/core/utils/app_colors.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  double opacity = 0.0; // Initial opacity is 0 (invisible)

  @override
  void initState() {
    super.initState();
    // Trigger the fade-in effect after a short delay
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1.0; // Set opacity to 1 (fully visible)
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 210),
          child: const SearchViewBody()),
    );
  }
}
