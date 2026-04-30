part of '../donation_details.dart';

class FundraisingCard extends StatelessWidget {
  final double amountRaised;
  final double goal;
  final int donations;
  final int daysLeft;

  const FundraisingCard({
    super.key,
    required this.amountRaised,
    required this.goal,
    required this.donations,
    required this.daysLeft,
  });

  double get _progress => (amountRaised / goal).clamp(0.0, 1.0);

  String _formatCurrency(double amount) {
    final int rounded = amount.toInt();
    if (rounded >= 1000) {
      final parts = rounded.toString().split('');
      final thousands = parts.sublist(0, parts.length - 3).join('');
      final hundreds = parts.sublist(parts.length - 3).join('');
      return '\$$thousands,$hundreds';
    }
    return '\$$rounded';
  }

  @override
  Widget build(BuildContext context) {
    return AppBlur(
      blur: 8,
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
      child: Container(
        decoration: BoxDecoration(
          gradient: UIProps.primaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: [AppTheme.c.white.base, AppTheme.c.white.s30],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            width: 4.w,
          ),
        ),
        padding: Space.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Amount raised row
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(_formatCurrency(amountRaised), style: AppText.h1xb),
                8.horizontalSpace,
                Text('raised', style: AppText.l1!.cl(AppTheme.c.white.s60)),
              ],
            ),

            8.verticalSpace,

            _ProgressBar(progress: _progress),

            10.verticalSpace,

            Row(
              children: [
                _StatItem(label: 'Goal', value: _formatCurrency(goal)),
                _StatItem(label: 'Donations', value: donations.toString()),
                _StatItem(label: 'Ends', value: '$daysLeft days'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Progress Bar ─────────────────────────────────────────────────────────────

class _ProgressBar extends StatelessWidget {
  final double progress;
  const _ProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final filledWidth = constraints.maxWidth * progress;
        return Container(
          height: 8.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.c.cardBg.s40,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                width: filledWidth,
                decoration: BoxDecoration(
                  color: AppTheme.c.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Stat Item ────────────────────────────────────────────────────────────────

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.l1!.cl(AppTheme.c.white.s60)),
          const SizedBox(height: 4),
          Text(value, style: AppText.b1!.cl(AppTheme.c.white.base)),
        ],
      ),
    );
  }
}
