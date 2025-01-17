import 'package:flutter/material.dart';

Future<T?> navigateWithFade<T>(
  BuildContext context,
  Widget page, {
  Duration duration = const Duration(milliseconds: 100),
}) {
  return Navigator.of(context).push<T>(
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
