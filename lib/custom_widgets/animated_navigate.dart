import 'package:flutter/material.dart';

animatedPageRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: Offset(1, 0),
            end: Offset.zero,
          ),
        ),
        child: child,
      );
    },
  );
}
