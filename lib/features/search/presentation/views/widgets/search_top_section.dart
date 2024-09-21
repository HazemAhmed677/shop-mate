import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/manager/add_to_search_box_cubit/add_to_search_cubit.dart';
import 'package:shop_mate/features/search/presentation/manager/fetch_searched_products_cubit%20copy/fetch_searched_products_cubit.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_search_text_feild.dart';

class SearchTopSection extends StatefulWidget {
  const SearchTopSection({
    super.key,
  });

  @override
  State<SearchTopSection> createState() => _SearchTopSectionState();
}

class _SearchTopSectionState extends State<SearchTopSection> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey textFieldKey = GlobalKey();
  String input = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          left: false,
          right: false,
          child: Center(
            child: Text(
              'Search',
              style: AppStyles.semiBoldInter16.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        SizedBox(
          height: 80,
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: CustomSearchTextFeild(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  input = value;
                  autovalidateMode = AutovalidateMode.disabled;
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
                setState(() {});
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter something to search';
                } else {
                  return null;
                }
              },
              onSubmitted: (value) async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  await BlocProvider.of<AddToSearchCubit>(context)
                      .addToSearch(searchedProduct: input);
                  await BlocProvider.of<FetchSearchedProductsCubit>(context)
                      .searchProducts(category: input);
                }
              },
              onPressedOnIcon: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  await BlocProvider.of<AddToSearchCubit>(context)
                      .addToSearch(searchedProduct: input);
                  await BlocProvider.of<FetchSearchedProductsCubit>(context)
                      .searchProducts(category: input);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
