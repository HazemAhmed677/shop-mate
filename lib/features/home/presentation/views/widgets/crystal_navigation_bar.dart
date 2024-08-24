import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CusomNavigationBar extends StatefulWidget {
  const CusomNavigationBar({
    super.key,
  });

  @override
  State<CusomNavigationBar> createState() => _CusomNavigationBarState();
}

class _CusomNavigationBarState extends State<CusomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CrystalNavigationBar(
      currentIndex: currentIndex,
      // indicatorColor: Colors.white,
      unselectedItemColor: Colors.white70,
      backgroundColor: const Color(
        0xff1F2029,
      ),
      // outlineBorderColor: Colors.black.withOpacity(0.1),
      onTap: (index) {
        currentIndex = index;
        setState(() {});
      },
      items: [
        /// Home
        CrystalNavigationBarItem(
          icon: IconlyBold.home,
          unselectedIcon: IconlyLight.home,
          selectedColor: Colors.white,
        ),

        /// Favourite
        CrystalNavigationBarItem(
          icon: IconlyBold.heart,
          unselectedIcon: IconlyLight.heart,
          selectedColor: Colors.red,
        ),

        /// Search
        CrystalNavigationBarItem(
            icon: IconlyBold.search,
            unselectedIcon: IconlyLight.search,
            selectedColor: Colors.white),

        /// Profile
        CrystalNavigationBarItem(
          icon: IconlyBold.user_2,
          unselectedIcon: IconlyLight.user,
          selectedColor: Colors.white,
        ),
      ],
    );
  }
}
