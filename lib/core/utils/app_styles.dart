import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle semiBold24 = const TextStyle(
    fontSize: 24,
    fontFamily: 'Matemasie',
  );
  static TextStyle regular24 = const TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
  );
  static TextStyle semiBoldPoppins28 = const TextStyle(
    fontSize: 28,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold58 = const TextStyle(
    fontSize: 58,
    fontFamily: 'Inter',
  );
  static TextStyle semiBoldInter32 = const TextStyle(
    fontSize: 32,
    fontFamily: 'Inter',
  );

  double getResponsiveText(
      {required BuildContext context, required double base}) {
    double scaleFactor = getScaleFactor(
      context: context,
    );
    double responsiveText = scaleFactor * base;
    double lowerLimit = responsiveText * 0.8;
    double upperLimit = responsiveText * 1.2;
    return responsiveText.clamp(lowerLimit, upperLimit);
  }

  double getScaleFactor({required BuildContext context}) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    return widthOfScreen / 400;
  }
}
