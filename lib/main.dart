import 'package:demo_app/router/router.dart';
import 'package:demo_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:navigation_history_observer/navigation_history_observer.dart';

import 'configs/configs.dart' as theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Set global system UI style
  services.SystemChrome.setSystemUIOverlayStyle(
    const services.SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  // ✅ Enable edge-to-edge (keeps nav bar visible)
  services.SystemChrome.setEnabledSystemUIMode(
    services.SystemUiMode.edgeToEdge,
    overlays: [services.SystemUiOverlay.top, services.SystemUiOverlay.bottom],
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final List<NavigatorObserver> observers = [];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<services.SystemUiOverlayStyle>(
      value: const services.SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
      ),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [...observers, NavigationHistoryObserver()],
        theme: theme.themeDark,
        initialRoute: AppRoutes.donationDetails,
        builder: (context, child) {
          theme.App.init(context);
          return child!;
        },
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoutes,
        routes: appRoutes,
      ),
    );
  }
}
