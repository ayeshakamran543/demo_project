part of 'configs.dart';

const headingFontFamily = 'SofiaSans';
const bodyFontFamily = 'Inter';

final themeDark = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppTheme.dark.black.base,
    foregroundColor: AppTheme.dark.white.base,
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.dark.white.base),
  ),
  useMaterial3: true,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    indicatorColor: AppTheme.dark.white.s20,
    iconTheme: WidgetStateProperty.all(
      IconThemeData(color: AppTheme.dark.primary),
    ),
  ),
  primaryColor: AppTheme.dark.primary,
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppTheme.dark.black.base,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(AppTheme.dark.primary),
  ),
  primaryColorDark: AppTheme.dark.primary,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: AppTheme.dark.primary,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    secondary: AppTheme.dark.primary,
    surface: AppTheme.dark.primary,
    onSurface: AppTheme.dark.white.base,
    primary: AppTheme.dark.primary,
  ),
);
