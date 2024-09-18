import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/manager/switch_views_cubit/switch_views_cubit.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_location.dart';
import '../../../../../core/widgets/custom_search_text_feild.dart';

class HomeViewHeaderSection extends StatefulWidget {
  const HomeViewHeaderSection({super.key});

  @override
  State<HomeViewHeaderSection> createState() => _HomeViewHeaderSectionState();
}

class _HomeViewHeaderSectionState extends State<HomeViewHeaderSection> {
  TextEditingController textEditingController = TextEditingController();
  String input = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 38,
        // ),
        const Row(
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
        const SizedBox(
          height: 22,
        ),
        CustomSearchTextFeild(
          controller: textEditingController,
          onPressedOnIcon: () {
            if (input.isNotEmpty) {
              BlocProvider.of<SwitchViewsCubit>(context).setIndex(3);
            }
          },
          onChanged: (value) {
            input = value;
          },
          onSubmitted: (value) {
            if (value != null || value!.isNotEmpty) {
              BlocProvider.of<SwitchViewsCubit>(context).setIndex(3);
            }
          },
        ),
      ],
    );
  }
}
