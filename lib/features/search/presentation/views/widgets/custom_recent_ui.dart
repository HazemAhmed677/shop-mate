import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mate/core/manager/fetch_search_box_cubit.dart/fetch_search_box_cubit.dart';
import 'package:shop_mate/core/manager/fetch_search_box_cubit.dart/fetch_search_box_state.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_recent_empty_searched.dart';
import 'package:shop_mate/features/search/presentation/views/widgets/custom_recent_existed_searched.dart';

class CustomRecentUI extends StatefulWidget {
  const CustomRecentUI({
    super.key,
  });

  @override
  State<CustomRecentUI> createState() => _CustomRecentUIState();
}

class _CustomRecentUIState extends State<CustomRecentUI> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchSearchBoxCubit>(context).fetchSearchBox();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchBoxCubit, FetchSearchBoxState>(
      builder: (context, state) {
        if (state is FetchSearchBoxSuccess) {
          return (state.searchedProductsList.isNotEmpty)
              ? CustomRecentExistedSearched(
                  searches: state.searchedProductsList,
                )
              : const CustomRecentEmptySearched(
                  text: 'No searches yet',
                );
        } else if (state is FetchSearchBoxFailure) {
          return CustomRecentEmptySearched(
            text: state.errorMessege,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
