import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_background.dart';
import 'package:demo_app/widgets/core/app_bar/app_bar.dart';
import 'package:demo_app/widgets/design/tournament_card.dart';
import 'package:demo_app/widgets/design/tournament_card_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(type: AppBarType.withTextCenter, title: 'Testing'),
      body: SingleChildScrollView(
        child: AppBackground(
          horizontalPadding: 0,
          child: Column(
            children: [
              TournamentCardCarousel(
                sectionTitle: 'YOU FOLLOW',
                tournaments: [
                  TournamentCardData(
                    title: '2026 BALLING ON THE BEACH',
                    dateRange: 'May 31 – June 2, 2026',
                    location: 'Fort Lauderdale, FL',
                    // Replace with your real asset paths or network URLs:
                    backgroundImage:
                        'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800',
                    logoImage:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/240px-Basketball.png',
                    onViewTournament: () => debugPrint('Card 1 tapped'),
                  ),
                  TournamentCardData(
                    title: '2026 BALLING ON THE BEACH',
                    dateRange: 'May 31 – June 02, 2026',
                    location: 'Fort Lauderdale, FL',
                    backgroundImage:
                        'https://images.unsplash.com/photo-1504450758481-7338eba7524a?w=800',
                    logoImage:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/240px-Basketball.png',
                    onViewTournament: () => debugPrint('Card 2 tapped'),
                  ),
                  TournamentCardData(
                    title: 'SUMMER SLAM 2026',
                    dateRange: 'July 4 – July 6, 2026',
                    location: 'Miami Beach, FL',
                    backgroundImage:
                        'https://images.unsplash.com/photo-1515523110800-9415d13b84a8?w=800',
                    logoImage:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/240px-Basketball.png',
                    onViewTournament: () => debugPrint('Card 3 tapped'),
                  ),
                ],
              ),
              Space.yf(16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const TournamentCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
