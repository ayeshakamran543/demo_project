import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SmallButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppBlur(
        blur: 48,
        borderRadius: BorderRadius.circular(8.r),

        child: Container(
          width: double.infinity,
          padding: Space.vf(10.5),
          decoration: BoxDecoration(
            color: AppTheme.c.disabled.s25,

            borderRadius: UIProps.buttonRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: AppText.b1bm!.cl(AppTheme.c.white.base)),
            ],
          ),
        ),
      ),
    );
  }
}
