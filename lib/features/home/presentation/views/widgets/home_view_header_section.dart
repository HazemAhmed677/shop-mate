import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/manager/add_to_search_box_cubit/add_to_search_cubit.dart';
import 'package:shop_mate/core/manager/switch_views_cubit/switch_views_cubit.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_location.dart';
import '../../../../../core/widgets/custom_search_text_feild.dart';
import '../../../../search/presentation/manager/fetch_searched_products_cubit copy/fetch_searched_products_cubit.dart';

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
            ),
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
              BlocProvider.of<FetchSearchedProductsCubit>(context)
                  .searchProducts(category: input);
            }
          },
          onChanged: (value) {
            input = value;
          },
          onSubmitted: (value) {
            if (input.isNotEmpty) {
              BlocProvider.of<SwitchViewsCubit>(context).setIndex(3);
              BlocProvider.of<FetchSearchedProductsCubit>(context)
                  .searchProducts(category: input);
              BlocProvider.of<AddToSearchCubit>(context)
                  .addToSearch(searchedProduct: input);
            }
          },
        ),
      ],
    );
  }
}
