import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/models/recent_supporters_model.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupporterCard extends StatelessWidget {
  final SupporterItem supporter;

  const SupporterCard({super.key, required this.supporter});

  @override
  Widget build(BuildContext context) {
    return AppBlur(
      blur: 48,
      child: Container(
        padding: Space.all(16),
        decoration: BoxDecoration(
          color: AppTheme.c.cardBg.s25,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            // Avatar circle with initials
            Container(
              width: 64.w,
              height: 64.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.c.cardBg.s40,
              ),
              child: Center(
                child: Text(supporter.initials, style: AppText.b1bm!.s(24.sp)),
              ),
            ),

            16.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Name + Amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(supporter.name, style: AppText.b1bm),

                      Text(
                        supporter.formattedAmount,
                        style: AppText.b1bm!.cl(AppTheme.c.green),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  // Time
                  Text(
                    supporter.timeAgo,
                    style: AppText.b2!.cl(AppTheme.c.tertiary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
