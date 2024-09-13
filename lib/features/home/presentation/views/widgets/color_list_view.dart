import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.only(
            right: (index != 11) ? 6 : 0,
            left: (index != 0) ? 6 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: CustomColorItem(
              isActive: (currentIndex == index),
            ),
          ),
        ),
      ),
    );
  }
}
