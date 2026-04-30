import 'package:demo_app/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imagePath;
  const CustomCircleAvatar({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 64.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        border: Border.all(
          color: AppTheme.c.white.s50,
          width: 2.w,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
    );
  }
}
