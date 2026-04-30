part of '../../player_profile.dart';

// ── Schedule Row ───────────────────────────────────────────────────────────

Widget _buildScheduleRow(GameScheduleItem item) {
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

  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
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
  );
}

Widget _buildScheduleList(List<GameScheduleItem> items) {
  return Stack(
    children: [
      Positioned(
        left: 30.w + 12.w + 4.w,
        top: 25.5,
        bottom: -50,
        child: Container(
          width: 2.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.c.white.base,
                AppTheme.c.white.base.withValues(alpha: 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),

      Column(
        children: List.generate(
          items.length,
          (index) => _buildScheduleRow(items[index]),
        ),
      ),
    ],
  );
}

Widget _buildScheduleTab() {
  return Padding(
    padding: Space.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UPCOMING GAME',
          style: AppText.h2xb!.copyWith(letterSpacing: 1.2),
        ),
        16.verticalSpace,

        _buildUpcomingGameCard(),

        40.verticalSpace,

        Text('JANUARY 2026', style: AppText.h2xb),
        24.verticalSpace,

        _buildScheduleList(_schedule),

        24.verticalSpace,
      ],
    ),
  );
}
