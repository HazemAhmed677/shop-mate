import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_item.dart';

class MyCartItemListView extends StatelessWidget {
  const MyCartItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {},
          ),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              icon: IconlyBold.delete,
              label: 'Remove',
              borderRadius: BorderRadius.circular(12),
              spacing: 8,
            ),
          ],
        ),
        child: (index != 9)
            ? const MyCartItem()
            : const MyCartItem(
                bottomDivider: false,
              ),
      ),
    );
  }
}
