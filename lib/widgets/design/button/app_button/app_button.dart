import 'package:demo_app/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'enums.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isDisabled;
  final Color? backgroundColor;
  final double? height;
  final Color? textColor;
  final TextStyle? textStyle;
  final ButtonType? buttonType;
  final String? iconPath;
  final Color? borderColor;
  final double? iconSize;
  final VoidCallback? onDoubleTap;
  final Color? iconColor;
  final double? horizontalPadding;
  final double? spaceBetweenIconAndText;
  final double? verticalPadding;
  final Gradient? gradient;

  const AppButton({
    required this.label,
    required this.onPressed,
    this.height,
    this.backgroundColor,
    this.textStyle,
    this.buttonType = ButtonType.primary,
    this.isDisabled = false,
    super.key,
    this.textColor,
    this.iconPath,
    this.borderColor,
    this.iconSize,
    this.onDoubleTap,
    this.iconColor,
    this.horizontalPadding,
    this.spaceBetweenIconAndText,
    this.verticalPadding,
    this.gradient,
  });

  bool get _isOutlined =>
      buttonType == ButtonType.outlined ||
      buttonType == ButtonType.outlinedWithIconLeft ||
      buttonType == ButtonType.outlinedWithIconRight;

  bool get _isPrimary =>
      buttonType == ButtonType.primary ||
      buttonType == ButtonType.primaryWithIconLeft ||
      buttonType == ButtonType.primaryWithIconRight;

  bool get _hasIconLeft =>
      buttonType == ButtonType.primaryWithIconLeft ||
      buttonType == ButtonType.outlinedWithIconLeft;

  bool get _hasIconRight =>
      buttonType == ButtonType.primaryWithIconRight ||
      buttonType == ButtonType.outlinedWithIconRight;

  Gradient? get _resolvedGradient {
    if (isDisabled || _isOutlined) return null;
    if (!_isPrimary) return null;
    return gradient ?? UIProps.secondaryGradient;
  }

  Color? get _resolvedBackgroundColor {
    if (isDisabled) return AppTheme.c.white.s40;
    if (_isOutlined) return backgroundColor ?? AppTheme.c.white.base;
    if (_resolvedGradient != null) return null;
    return backgroundColor ?? AppTheme.c.primary;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: isDisabled ? () {} : onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: UIProps.buttonRadius,
          gradient: _resolvedGradient,
          color: _resolvedBackgroundColor,
          border: _isOutlined
              ? Border.all(
                  color: isDisabled
                      ? AppTheme.c.disabled.s25
                      : borderColor ?? AppTheme.c.white.s40,
                  width: 1.w,
                )
              : null,
        ),
        padding: Space.vf(verticalPadding ?? 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon on the left
            if (_hasIconLeft)
              Row(
                children: [
                  iconColor != null
                      ? SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 24.w,
                          height: iconSize ?? 24.h,
                          colorFilter: ColorFilter.mode(
                            isDisabled ? AppTheme.c.white.base : iconColor!,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 24.w,
                          height: iconSize ?? 24.h,
                        ),
                  SizedBox(width: spaceBetweenIconAndText ?? 12.w),
                ],
              ),

            // Label text
            Text(
              label,
              style: isDisabled
                  ? textStyle?.copyWith(color: AppTheme.c.white.s50) ??
                        AppText.b1bm!.cl(AppTheme.c.white.s50)
                  : textStyle ??
                        AppText.b1bm!
                            .cl(
                              textColor ??
                                  (_isOutlined
                                      ? AppTheme.c.white.base
                                      : AppTheme.c.white.base),
                            )
                            .copyWith(height: 1.5),
            ),
            // Icon on the right
            if (_hasIconRight)
              Row(
                children: [
                  SizedBox(width: spaceBetweenIconAndText ?? 12.w),
                  iconColor != null
                      ? SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 24.w,
                          height: iconSize ?? 24.h,
                          colorFilter: ColorFilter.mode(
                            isDisabled ? AppTheme.c.white.base : iconColor!,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          iconPath!,
                          width: iconSize ?? 24.w,
                          height: iconSize ?? 24.h,
                        ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
