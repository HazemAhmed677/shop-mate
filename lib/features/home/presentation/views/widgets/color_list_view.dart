import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_color_item.dart';

import '../../../../../core/utils/app_styles.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  Map<int, String> colorMap = {
    0: 'Black',
    1: 'Red',
    2: 'Blue',
    3: 'Green',
    4: 'Yellow',
    5: 'Orange',
    6: 'Brown',
    7: 'Pink',
    8: 'Cyan',
  };
  List<Color> colorList = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.brown,
    Colors.pink,
    Colors.cyan,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              colorMap[currentIndex]!,
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
        SizedBox(
          height: 48,
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: colorList.length,
            itemBuilder: (BuildContext context, int index) => Column(
              children: [
                Padding(
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
                      color: colorList[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
