import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class LoremText extends StatelessWidget {
  const LoremText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur',
              style: AppStyles.semiBoldInter16.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'adipiscing elit, sed do eiusmod tempor incididunt',
              style: AppStyles.semiBoldInter16.copyWith(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
