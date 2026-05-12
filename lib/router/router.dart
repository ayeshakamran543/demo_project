import 'package:demo_app/router/routes.dart';
import 'package:demo_app/screens/appbar_testing.dart';
import 'package:demo_app/screens/donation_details/donation_details.dart';
import 'package:demo_app/screens/player_profile/player_profile.dart';
import 'package:demo_app/screens/sign_up.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.donationDetails: (_) => const DonationDetailsScreen(),
  AppRoutes.playerProfile: (_) => const PlayerProfileScreen(),
  AppRoutes.signUp: (_) => const SignUpScreen(),
  AppRoutes.testing: (_) => const TestingScreen(),
};

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    SlideRoute(
      settings: RouteSettings(name: ModalRoute.of(context)?.settings.name),
      child: screen,
    ),
  );
}

void navigateToFullScreen(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(
    context,
    rootNavigator: true,
  ).pushNamed(routeName, arguments: arguments);
}

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.donationDetails:
      return FadeRoute(
        settings: settings,
        child: const DonationDetailsScreen(),
      );
    case AppRoutes.playerProfile:
      return FadeRoute(settings: settings, child: const PlayerProfileScreen());

    default:
      return null;
  }
}

////////////////////////////////////////////////////////////////////////Custom Routes for transitions////////////////////////////////////////////////////////////////////////
class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          return FadeTransition(opacity: ani1, child: child);
        },
      );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  ScaleRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          final scaleAnimation = Tween(begin: 0.95, end: 1.0).animate(ani1);

          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      );
}

class SlideRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  SlideRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // from right to left
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      );
}
