import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/core/manager/delete_from_search_box_cubit/delete_from_search_cubit.dart';
import 'package:shop_mate/core/manager/fetch_search_box_cubit.dart/fetch_search_box_cubit.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomRecentItem extends StatefulWidget {
  const CustomRecentItem({super.key, required this.text});
  final String text;

  @override
  State<CustomRecentItem> createState() => _CustomRecentItemState();
}

class _CustomRecentItemState extends State<CustomRecentItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () async {
            await BlocProvider.of<DeleteFromSearchCubit>(context)
                .deleteFromSearch(searchedProduct: widget.text);
            if (mounted) {
              setState(() {
                BlocProvider.of<FetchSearchBoxCubit>(context).fetchSearchBox();
              });
            }
          },
          icon: const Icon(
            FontAwesomeIcons.circleXmark,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
