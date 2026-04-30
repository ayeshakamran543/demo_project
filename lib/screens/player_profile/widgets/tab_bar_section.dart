part of '../player_profile.dart';

// ── Tabs ───────────────────────────────────────────────────────────────────

Widget _buildTabSection(BuildContext context) {
  // Read selected tab from state
  final state = _ScreenState.s(context, true);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [_buildTabBar(state), _buildTabContent(state)],
  );
}

Widget _buildTabBar(_ScreenState state) {
  final tabs = ['Schedule', 'Followers', 'Video', 'Stats'];

  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0x2ED9D9D9), width: 2.w),
      ),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final selected = state.selectedTab == i;

          return GestureDetector(
            onTap: () => state.setTab(i),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Text(tabs[i], style: AppText.b1bm),
                ),

                /// 🔥 Gradient indicator
                AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  height: 2.h,
                  width: selected ? 90.w : 0, // animate width
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.c.secondaryGradient.end,
                        AppTheme.c.secondaryGradient.start,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    ),
  );
}

Widget _buildTabContent(_ScreenState state) {
  final tabs = ['Schedule', 'Followers', 'Video', 'Stats'];
  if (state.selectedTab != 0) {
    return Padding(
      padding: EdgeInsets.all(40.w),
      child: Center(
        child: Text(
          '${tabs[state.selectedTab]} coming soon',
          style: AppText.b1!.cl(AppTheme.c.white.base),
        ),
      ),
    );
  }

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
        // In _buildTabContent method:
        Column(
          children: _schedule.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final bool showLine =
                index !=
                _schedule.length - 1; // Don't show line after last item
            return _buildScheduleRow(item, showLine: showLine);
          }).toList(),
        ),
        24.verticalSpace,
      ],
    ),
  );
}
