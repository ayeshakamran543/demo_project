part of '../../player_profile.dart';

// ── Schedule Row ───────────────────────────────────────────────────────────

Widget _buildScheduleRow(GameScheduleItem item, {bool showLine = true}) {
  final Color dotColor;
  final Color resultColor;

  if (item.result == null || item.result == '0-0') {
    dotColor = Colors.white;
    resultColor = Colors.white;
  } else if (item.isWin) {
    dotColor = AppTheme.c.green;
    resultColor = AppTheme.c.green;
  } else {
    dotColor = AppTheme.c.orange;
    resultColor = AppTheme.c.orange;
  }

  return Stack(
    children: [
      // Vertical connecting line
      if (showLine)
        Positioned(
          left:
              30.w +
              12.w +
              5.w, // Center of the dot (width/2 + Space.xf(12) + dot radius)
          top: 0,
          bottom: 0,
          child: Container(width: 2.w, color: Colors.white.withOpacity(0.15)),
        ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Date
            SizedBox(
              width: 30.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.day, style: AppText.l1bm),
                  Text(item.date.toString(), style: AppText.h2xb),
                ],
              ),
            ),
            Space.xf(12),
            // Dot with line connector
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor,
                border: Border.all(color: Color(0xFF2C669E), width: 2.w),
              ),
            ),
            Space.xf(12),
            // Card
            Expanded(
              child: AppBlur(
                blur: 48,
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  padding: Space.all(16, 18.5),
                  decoration: BoxDecoration(
                    color: AppTheme.c.cardBg.s25,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(item.opponent, style: AppText.b1bm)),
                      Text(
                        item.result ?? '0-0',
                        style: AppText.l1b!.cl(resultColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
