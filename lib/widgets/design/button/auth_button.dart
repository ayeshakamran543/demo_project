import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String? iconPath;

  const AuthButton({
    super.key,
    required this.label,
    required this.onTap,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppBlur(
        blur: 48,
        borderRadius: BorderRadius.circular(8.r),

        child: Container(
          width: double.infinity,
          padding: Space.vf(12),
          decoration: BoxDecoration(
            color: AppTheme.c.disabled.s25,

            borderRadius: UIProps.buttonRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) ...[
                SvgPicture.asset(iconPath!, width: 24.w, height: 24.h),
                8.horizontalSpace,
              ],
              Text(label, style: AppText.b1bm!.w(6).cl(AppTheme.c.white.base)),
            ],
          ),
        ),
      ),
    );
  }
}
