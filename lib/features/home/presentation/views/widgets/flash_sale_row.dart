import 'package:flutter/material.dart';
import 'package:shop_mate/features/home/presentation/views/widgets/custom_time.dart';

import '../../../../../core/utils/app_styles.dart';

class FlashSaleRow extends StatelessWidget {
  const FlashSaleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Flash Sale',
          style: AppStyles.regular24(context).copyWith(
            fontSize: getResponsiveText(context: context, base: 18),
          ),
        ),
        const Spacer(),
        Text(
          'Closing at : ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: getResponsiveText(context: context, base: 14),
          ),
        ),
        //
        const CustomTime(
          time: '12',
        ),
        const CustomTime(
          time: '40',
        ),
        const CustomTime(
          time: '00',
          flag: true,
        ),
      ],
    );
  }
}
