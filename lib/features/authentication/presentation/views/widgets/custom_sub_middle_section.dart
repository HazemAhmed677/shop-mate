import 'package:flutter/widgets.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/row_of_dividers.dart';

class CustomSubMiddleSection extends StatelessWidget {
  const CustomSubMiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RowOfDividers(
          text: 'Or sign in with',
        ),
        Expanded(
          child: SizedBox(
            height: 32,
          ),
        ),
      ],
    );
  }
}
