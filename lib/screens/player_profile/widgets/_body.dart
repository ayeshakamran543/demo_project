part of '../player_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '@jayryan',
        type: AppBarType.withWidget,
        trailingWidget: SvgPicture.asset(
          'assets/svgs/share.svg',
          width: 24.w,
          height: 24.h,
        ),
      ),
      body: AppBackground(
        horizontalPadding: 0,
        backgroundImage: 'assets/pngs/playerProfile_bg.png',
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeroSection(),
              _buildStatsRow(),
              _buildTabSection(context),
            ],
          ),
        ),
      ),
    );
  }

  // ── Hero / Header ──────────────────────────────────────────────────────────

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Space.yf(24),
        // Avatar
        Padding(
          padding: Space.hf(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCircleAvatar(imagePath: 'assets/pngs/pp.png'),
              12.verticalSpace,
              // Name
              Text(
                'JAY RYAN',
                style: AppText.h2xb!.copyWith(letterSpacing: 1.5),
              ),
              12.verticalSpace,
              // Team dropdown
              _buildTeamDropdown(),
              10.verticalSpace,
              // Followers
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/user.svg',
                    width: 18.w,
                    height: 18.h,
                  ),
                  Space.xf(8),
                  Text('7 followers', style: AppText.b2bm!),
                ],
              ),
            ],
          ),
        ),
        10.verticalSpace,
        // Attribute tags
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: Space.only(left: 24.w),
          child: Row(
            children: [
              _buildTag('assets/svgs/pull-request.svg', 'PG'),
              Space.xf(16),
              _buildTag('assets/svgs/ruler.svg', '6.2"'),
              Space.xf(16),
              _buildTag('assets/svgs/age.svg', 'Senior'),
              Space.xf(16),
              _buildTag('assets/svgs/graduation-cap.svg', 'Central High'),
            ],
          ),
        ),
        14.verticalSpace,
        // Follow button
        Padding(
          padding: Space.hf(24),
          child: Column(
            children: [
              AppButton(label: 'Follow', onPressed: () {}),
              16.verticalSpace,
              // Browse Shop
              _buildBrowseShop(),
            ],
          ),
        ),
        16.verticalSpace,
      ],
    );
  }

  // ── Stats Row ──────────────────────────────────────────────────────────────

  Widget _buildStatsRow() {
    return AppBlur(
      blur: 8,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: Space.hf(24),
        padding: Space.vf(16),
        decoration: BoxDecoration(
          color: AppTheme.c.cardBg.s40,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            _buildStatCell(_stats.pts.toString(), 'PTS'),
            _buildStatCell(_stats.ast.toString(), 'AST'),
            _buildStatCell(_stats.reb.toString(), 'REB'),
            _buildStatCell(_stats.gp.toString(), 'GP'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCell(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: AppText.h2xb),
          Text(label, style: AppText.b1!.copyWith(letterSpacing: 0)),
        ],
      ),
    );
  }
}
