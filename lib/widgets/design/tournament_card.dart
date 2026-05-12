import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlur(
      blur: 48,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.c.cardBg.s25,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              width: 64.w,
              height: 64.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.c.white.s20,
              ),
              child: Icon(
                Icons.sports_soccer,
                color: AppTheme.c.white.base,
                size: 30,
              ),
            ),

            16.horizontalSpace,

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2026 Balling on the Beach',
                  style: AppText.b1bm,
                  overflow: TextOverflow.ellipsis,
                ),

                4.verticalSpace,

                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  label: 'May 31 - June 2, 2026',
                ),

                4.verticalSpace,

                _InfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Fort Lauderdale, FL',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        8.horizontalSpace,
        Text(label, style: AppText.b2bm, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
