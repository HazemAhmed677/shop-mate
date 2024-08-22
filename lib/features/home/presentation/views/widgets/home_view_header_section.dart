import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_location.dart';
import '../../../../../core/widgets/custom_search_text_feild.dart';

class HomeViewHeaderSection extends StatelessWidget {
  const HomeViewHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 32,
        ),
        Row(
          children: [
            CustomLocation(),
            Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xffF1F1F1),
              child: Icon(
                FontAwesomeIcons.solidBell,
                color: Colors.black,
              ),
            )
          ],
        ),
        SizedBox(
          height: 22,
        ),
        CustomSearchTextFeild(),
      ],
    );
  }
}
