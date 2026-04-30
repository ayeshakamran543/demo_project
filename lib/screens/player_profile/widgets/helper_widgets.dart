part of '../player_profile.dart';

/////////////Hero section helper widgets//////////////////////////////

Widget _buildTeamDropdown() {
  return AppBlur(
    blur: 104,
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      padding: Space.all(16, 12),
      decoration: BoxDecoration(
        color: Color(0x33EBEBEB),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Image.asset('assets/pngs/C2.png', width: 24.w, height: 24.h),
          Space.xf(10),
          Text('South Beach Sparks, #12', style: AppText.b1bm!),
          Space.xm!,
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppTheme.c.white.base,
            size: 18.sp,
          ),
        ],
      ),
    ),
  );
}

Widget _buildTag(String iconPath, String label) {
  return AppBlur(
    blur: 104,
    borderRadius: BorderRadius.circular(70.r),
    child: Container(
      padding: Space.all(8, 7),
      decoration: BoxDecoration(
        color: Color(0x4D0E1137),
        borderRadius: BorderRadius.circular(70.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, height: 18.h, width: 18.w),
          Space.xf(8),
          Text(label, style: AppText.b2bm),
        ],
      ),
    ),
  );
}

Widget _buildBrowseShop() {
  return AppBlur(
    blur: 104,
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      width: double.infinity,
      padding: Space.all(16, 12),
      decoration: BoxDecoration(
        gradient: UIProps.primaryGradient,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svgs/shopping-bag.svg',

            height: 24.h,
            width: 24.w,
          ),
          Space.xf(8),
          Text('Browse Shop', style: AppText.b1bm),
          const Spacer(),
          Icon(Icons.arrow_forward, size: 22.sp),
        ],
      ),
    ),
  );
}

// ── Upcoming Game Card ─────────────────────────────────────────────────────

Widget _buildUpcomingGameCard() {
  return AppBlur(
    blur: 8,
    borderRadius: BorderRadius.circular(12.r),
    child: Container(
      padding: Space.all(16),
      decoration: BoxDecoration(
        gradient: UIProps.primaryGradient,
        borderRadius: BorderRadius.circular(12.r),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [AppTheme.c.white.base, AppTheme.c.white.s30],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          width: 4.w,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCircleAvatar(imagePath: 'assets/pngs/C1.png'),
              Column(
                children: [
                  AppBlur(
                    blur: 104,
                    borderRadius: BorderRadius.circular(70.r),
                    child: Container(
                      padding: Space.all(8, 4.5),
                      decoration: BoxDecoration(
                        color: Color(0x4D0E1137),
                        borderRadius: BorderRadius.circular(70.r),
                      ),
                      child: Text('JUNE 18', style: AppText.l1bm),
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    '10:00 PM',
                    style: AppText.h2xb!.copyWith(letterSpacing: 0),
                  ),
                ],
              ),
              CustomCircleAvatar(imagePath: 'assets/pngs/C3.png'),
            ],
          ),
          Padding(
            padding: Space.all(4, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'South Beach\nSparks',
                  textAlign: TextAlign.center,
                  style: AppText.l1bm!,
                ),
                Text('ARLIN R. HORTON \nSPORTS CENTER', style: AppText.l1b!),

                Text(
                  'Bayside Ballers',
                  textAlign: TextAlign.center,
                  style: AppText.l1bm,
                ),
              ],
            ),
          ),
          4.verticalSpace,
          Row(
            children: [
              Expanded(child: _buildGameButton('Predict')),
              Space.xf(10),
              Expanded(child: _buildGameButton('Vote')),
            ],
          ),
          10.verticalSpace,
          _buildGameButton('Game Hub', fullWidth: true),
        ],
      ),
    ),
  );
}

Widget _buildGameButton(String label, {bool fullWidth = false}) {
  return SizedBox(
    width: fullWidth ? double.infinity : null,
    child: AppBlur(
      blur: 104,
      borderRadius: BorderRadius.circular(8.r),

      child: Container(
        padding: Space.all(12, 10.5),
        decoration: BoxDecoration(
          color: Color(0x40EBEBEB),
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,

        child: Text(label, style: AppText.b1bm!),
      ),
    ),
  );
}

Widget _comingSoon(String title) {
  return Padding(
    padding: Space.all(40),
    child: Center(
      child: Text(
        '$title coming soon',
        style: AppText.b1!.cl(AppTheme.c.white.base),
      ),
    ),
  );
}
