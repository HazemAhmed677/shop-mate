import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const HomeViewBody(),
          Positioned(
            // right: 0,
            // left: 0,
            bottom: 22,
            child: Container(),
            // child: CusomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
