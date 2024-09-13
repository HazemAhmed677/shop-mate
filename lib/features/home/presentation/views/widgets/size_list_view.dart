import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_size_container.dart';

class SizeListView extends StatefulWidget {
  const SizeListView({
    super.key,
  });

  @override
  State<SizeListView> createState() => _SizeListViewState();
}

class _SizeListViewState extends State<SizeListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: (index != 6) ? 14 : 0,
              left: (index != 0) ? 14 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: CustomSizeContainer(
                isActive: (currentIndex == index),
              ),
            ),
          );
        },
      ),
    );
  }
}
