import 'package:flutter/material.dart';

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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter something to search';
                } else {
                  return null;
                }
              },
              onSubmitted: (input) {
                validateSearchInput();
              },
              onPressedOnIcon: () {
                validateSearchInput();
              },
              controller: searchController,
            ),
          ),
        ),
      ],
    );
  }

  void validateSearchInput() {
    if (formKey.currentState!.validate()) {
      autovalidateMode = AutovalidateMode.disabled;
      formKey.currentState!.save();
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    }
    setState(() {});
  }
}
