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
          style: AppStyles.regular24.copyWith(
            fontSize: 18,
          ),
        ),
        const Spacer(),
        const Text(
          'Closing at : ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
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
