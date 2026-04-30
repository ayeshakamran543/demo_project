part of '../donation_details.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.c.primary, // scaffold fills primary colour
      appBar: CustomAppBar(
        title: 'Donation Details',
        type: AppBarType.withWidget,
        trailingWidget: SvgPicture.asset(
          'assets/svgs/share.svg',
          width: 24.w,
          height: 24.h,
        ),
      ),
      bottomNavigationBar: const _ContinueBar(),
      body: SingleChildScrollView(
        child: AppBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              CustomCircleAvatar(imagePath: 'assets/pngs/C1.png'),
              16.verticalSpace,
              Text(
                'Travel Expenses, help the team cover their travel cost (hotel, food, transportation)',
                style: AppText.h2xb,
              ),
              16.verticalSpace,
              _buildVerifiedBadge(),
              40.verticalSpace,
              FundraisingCard(
                amountRaised: 3250,
                goal: 8000,
                donations: 42,
                daysLeft: 12,
              ),
              40.verticalSpace,
              Text('Our Story', style: AppText.h2xb),
              16.verticalSpace,
              Text(
                'We\'re raising funds to support our journey to the state finals. '
                'Your donation will help cover essential costs including travel, '
                'lodging, equipment, and tournament fees. Every dollar goes directly '
                'toward helping our players compete at their best and represent our '
                'school with pride.',
                style: AppText.b1,
              ),
              40.verticalSpace,
              Text('Recent Supporters', style: AppText.h2xb),
              16.verticalSpace,
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: supporters.length,
                separatorBuilder: (_, __) => 16.verticalSpace,
                itemBuilder: (context, index) =>
                    SupporterCard(supporter: supporters[index]),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerifiedBadge() {
    return Container(
      padding: Space.all(8, 4),
      decoration: BoxDecoration(
        color: AppTheme.c.lightGreen,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svgs/check-circle.svg',
            width: 24.w,
            height: 24.h,
          ),
          Space.xf(8),
          Text('Verified', style: AppText.b2bm!.cl(AppTheme.c.green)),
        ],
      ),
    );
  }
}

// ─── Fixed Glassmorphic Continue Bar ─────────────────────────────────────────

class _ContinueBar extends StatelessWidget {
  const _ContinueBar();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0x030B1C2D),
            border: Border(top: BorderSide(color: Color(0x33FFFFFF), width: 1)),
          ),
          padding: Space.all(16),
          child: AppButton(
            label: 'Continue',
            onPressed: () {
              AppRoutes.playerProfile.push(context);
            },
          ),
        ),
      ),
    );
  }
}
