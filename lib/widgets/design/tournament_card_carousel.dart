import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ─────────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────────

class TournamentCardData {
  final String title;
  final String dateRange;
  final String location;
  final String backgroundImage; // network URL or local asset path
  final String logoImage; // network URL or local asset path
  final bool isAsset; // true → AssetImage, false → NetworkImage
  final VoidCallback? onViewTournament;

  const TournamentCardData({
    required this.title,
    required this.dateRange,
    required this.location,
    required this.backgroundImage,
    required this.logoImage,
    this.isAsset = false,
    this.onViewTournament,
  });
}

// ─────────────────────────────────────────────
// CAROUSEL WIDGET
// ─────────────────────────────────────────────

class TournamentCardCarousel extends StatefulWidget {
  final List<TournamentCardData> tournaments;

  final double sectionHeight;

  final double? cardWidth;
  final String sectionTitle;

  const TournamentCardCarousel({
    super.key,
    required this.tournaments,
    this.sectionHeight = 510,

    this.cardWidth,

    this.sectionTitle = 'YOU FOLLOW',
  });

  @override
  State<TournamentCardCarousel> createState() => _TournamentCardCarouselState();
}

class _TournamentCardCarouselState extends State<TournamentCardCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.88);
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() => _currentPage = page);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = widget.cardWidth ?? screenWidth * 0.85;

    return SizedBox(
      height: widget.sectionHeight,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Section header ──────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 14, 16),
            child: Text(
              widget.sectionTitle,
              style: AppText.h2xb!.copyWith(height: 1),
            ),
          ),

          // ── Cards ───────────────────────────────────
          SizedBox(
            height: 430.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.tournaments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: _TournamentCard(
                    data: widget.tournaments[index],
                    width: cardWidth,
                    height: 430.h,
                  ),
                );
              },
            ),
          ),

          // ── Dot indicators ──────────────────────────
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.tournaments.length, (i) {
              final active = i == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: active ? Colors.white : Colors.white38,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SINGLE CARD
// ─────────────────────────────────────────────

class _TournamentCard extends StatelessWidget {
  final TournamentCardData data;
  final double width;
  final double height;

  const _TournamentCard({
    required this.data,
    required this.width,
    required this.height,
  });

  ImageProvider _buildImage(String url, bool isAsset) =>
      isAsset ? AssetImage(url) : NetworkImage(url) as ImageProvider;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ── Background image ───────────────────
            Image(
              image: _buildImage(data.backgroundImage, data.isAsset),
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(color: Colors.grey[800]),
            ),

            // ── Dark gradient overlay ──────────────
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xAA000000),
                    Color(0xDD000000),
                  ],
                  stops: [0.3, 0.65, 1.0],
                ),
              ),
            ),

            // ── Content ────────────────────────────
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Container(
                    width: 108.w,
                    height: 108.w,
                    decoration: BoxDecoration(
                      color: AppTheme.c.white.s80,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image(
                        image: _buildImage(data.logoImage, data.isAsset),
                        width: 108.w,
                        height: 108.w,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Icon(
                          Icons.sports_basketball,
                          size: 64,
                          color: AppTheme.c.orange,
                        ),
                      ),
                    ),
                  ),

                  16.verticalSpace,

                  // Title
                  Text(
                    data.title,
                    style: AppText.h1xb!.s(56.sp).copyWith(height: 1.1),
                  ),

                  16.verticalSpace,

                  // Date row
                  _InfoRow(
                    icon: Icons.calendar_today_outlined,
                    label: data.dateRange,
                  ),

                  8.verticalSpace,

                  // Location row
                  _InfoRow(
                    icon: Icons.location_on_outlined,
                    label: data.location,
                  ),

                  14.verticalSpace,

                  // CTA button
                  _ViewTournamentButton(onTap: data.onViewTournament),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// HELPER WIDGETS
// ─────────────────────────────────────────────

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
        Flexible(
          child: Text(
            label,
            style: AppText.b2bm,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ViewTournamentButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _ViewTournamentButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppBlur(
        blur: 48,
        borderRadius: UIProps.buttonRadius,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.5.h),
          decoration: BoxDecoration(
            color: AppTheme.c.disabled.s25,
            borderRadius: UIProps.buttonRadius,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('View Tournament', style: AppText.b1),
              Icon(Icons.arrow_forward, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
