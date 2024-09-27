import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: SizedBox(
        height: 2,
        child: Row(
          children: List.generate(
            22,
            (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: (index == 29) ? 0 : 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffB8B8B8),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
