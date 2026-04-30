import 'package:demo_app/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget {
  final Color? dividerColor;
  const AppDivider({super.key, this.dividerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.h,
      color: dividerColor ?? AppTheme.c.white.s40,
    );
  }
}
