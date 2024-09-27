import 'package:flutter/material.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/thank_you_word.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/total_price.dart';

import 'all_item_of_thank_you.dart';

class ThankYouElements extends StatelessWidget {
  const ThankYouElements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ThankYouWord(),
        AllItemsOfThankYou(),
        Divider(
          thickness: 2,
          color: Color(0xffC7C7C7),
        ),
        SizedBox(
          height: 24,
        ),
        TotalPrice(),
      ],
    );
  }
}
