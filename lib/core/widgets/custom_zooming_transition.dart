import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomZoomingTransition extends CustomTransitionPage<void> {
  CustomZoomingTransition(
      {required LocalKey super.key,
      required super.child,
      required int duration})
      : super(
          transitionDuration: Duration(milliseconds: duration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}
