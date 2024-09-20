import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController searchController = TextEditingController();
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
                input = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter something to search';
                } else {
                  return null;
                }
              },
              onSubmitted: (value) {
                if (validateSearchInput()) {
                  BlocProvider.of<FetchSearchedProductsCubit>(context)
                      .searchProducts(category: input);
                }
              },
              onPressedOnIcon: () {
                if (validateSearchInput()) {
                  BlocProvider.of<FetchSearchedProductsCubit>(context)
                      .searchProducts(category: input);
                }
              },
              controller: searchController,
            ),
          ),
        ),
      ],
    );
  }

  bool validateSearchInput() {
    if (formKey.currentState!.validate()) {
      autovalidateMode = AutovalidateMode.disabled;
      formKey.currentState!.save();
      setState(() {});
      return true;
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
      setState(() {});
      return false;
    }
  }
}
