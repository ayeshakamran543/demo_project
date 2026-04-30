import 'dart:ui';

import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/statics/app_statics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

part 'enums.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarType type;
  final String? title;
  final double? space;
  final double? verticalPadding;
  final VoidCallback? onBackPressed;
  final Widget? trailingWidget;
  final Widget? stepperWidget;
  final VoidCallback? onFilterTap;
  final Color? itemColor;
  final Color? iconColor;
  final bool hasLeadingIcon;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const CustomAppBar({
    super.key,
    this.type = AppBarType.primary,
    this.title,
    this.space,
    this.onBackPressed,
    this.trailingWidget,
    this.verticalPadding,
    this.onFilterTap,
    this.itemColor,
    this.stepperWidget,
    this.iconColor,
    this.hasLeadingIcon = true,
    this.systemOverlayStyle,
  });

  @override
  Size get preferredSize => Size.fromHeight(112.h);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final SystemUiOverlayStyle overlayStyle =
        systemOverlayStyle ??
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: ClipRect(
        child: BackdropFilter(
          // backdrop-filter: blur(30px)
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.c.black.base,
              // box-shadow: 0px 2px 40px 0px #0000001A
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Status bar area (32.h) ───────────────────────────────
                SizedBox(height: 40.h),

                // ── App bar content row (62.h) ───────────────────────────
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: verticalPadding ?? 22,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (hasLeadingIcon &&
                          type != AppBarType.textOnly &&
                          type != AppBarType.textOnlyLeft &&
                          !(type == AppBarType.withWidget &&
                              hasLeadingIcon == false))
                        GestureDetector(
                          onTap: onBackPressed ?? () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            AppStaticData.backArrow,
                            width: 24.w,
                            height: 24.h,
                          ),
                        )
                      else
                        const SizedBox.shrink(),

                      if (type == AppBarType.withText && title != null) ...[
                        Space.xf(space ?? 0),
                        Text(
                          title!,
                          style: AppText.b1bm!
                              .cl(itemColor ?? AppTheme.c.white.base)
                              .copyWith(height: 1.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ] else if (type == AppBarType.withWidget &&
                          title != null) ...[
                        (space != null) ? Space.xf(space!) : Space.xm!,
                        Text(
                          title!,
                          style: AppText.b1bm!
                              .cl(itemColor ?? AppTheme.c.white.base)
                              .copyWith(height: 1.0),
                        ),
                        Space.xm!,
                        trailingWidget ?? const SizedBox.shrink(),
                      ] else if (type == AppBarType.textOnly ||
                          type == AppBarType.textOnlyLeft) ...[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: type == AppBarType.textOnlyLeft
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              Text(
                                title ?? '',
                                style: AppText.b1bm!
                                    .cl(itemColor ?? AppTheme.c.white.base)
                                    .copyWith(height: 1.0),
                              ),
                            ],
                          ),
                        ),
                      ] else if (type == AppBarType.withTextCenter) ...[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title ?? '',
                                style: AppText.b1bm!
                                    .cl(itemColor ?? AppTheme.c.white.base)
                                    .copyWith(height: 1.0),
                              ),
                              Space.xf(16),
                            ],
                          ),
                        ),
                      ] else if (type == AppBarType.stepper) ...[
                        Space.xf(space ?? 0),
                        stepperWidget ?? const SizedBox.shrink(),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
