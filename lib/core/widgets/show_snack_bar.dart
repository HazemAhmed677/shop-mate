import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.black,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      content: Text(
        e,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
