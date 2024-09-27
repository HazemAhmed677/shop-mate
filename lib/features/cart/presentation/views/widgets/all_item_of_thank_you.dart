import 'package:flutter/material.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/thank_you_item.dart';

class AllItemsOfThankYou extends StatelessWidget {
  const AllItemsOfThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 42,
        ),
        ThankYouItem(text1: 'Date', text2: '12/12/2022'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: ThankYouItem(text1: 'Time', text2: '10:15 AM'),
        ),
        ThankYouItem(text1: 'To', text2: 'Sam Louis'),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
