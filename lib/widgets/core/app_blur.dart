import 'dart:ui';
import 'package:flutter/material.dart';

class AppBlur extends StatelessWidget {
  final double blur;
  final Widget child;
  final BorderRadius? borderRadius;

  const AppBlur({
    super.key,
    required this.blur,
    required this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }
}
