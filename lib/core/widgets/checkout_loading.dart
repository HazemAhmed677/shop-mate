import 'package:flutter/material.dart';

class LoadingCheckout extends StatelessWidget {
  const LoadingCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
  }
}
