import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/custom_amount_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomActionsRow extends StatefulWidget {
  const CustomActionsRow({super.key});

  @override
  State<CustomActionsRow> createState() => _CustomActionsRowState();
}

class _CustomActionsRowState extends State<CustomActionsRow> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAmountButton(
          iconData: FontAwesomeIcons.minus,
          backgroundColor: const Color(0xffEDEDED),
          iconColor: Colors.black,
          onPressed: () {
            if (amount > 1) {
              amount--;
              setState(() {});
            }
          },
          overlayColor: AppColors.primaryColor.withOpacity(0.5),
        ),
        SizedBox(
          width: 24,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount.toString(),
              style: AppStyles.regular24(context).copyWith(
                fontSize: getResponsiveText(context: context, base: 14),
              ),
            ),
          ),
        ),
        CustomAmountButton(
          iconData: FontAwesomeIcons.plus,
          backgroundColor: AppColors.primaryColor,
          iconColor: AppColors.white,
          onPressed: () {
            amount++;
            setState(() {});
          },
          overlayColor: AppColors.white.withOpacity(
            0.7,
          ),
        )
      ],
    );
  }
}
