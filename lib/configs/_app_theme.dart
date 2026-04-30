part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    primary: const Color(0xFF3B84C9),
    secondary: const Color(0xFF0B1C2D),
    tertiary: const Color(0xFFD8EBFD),

    /// PRIMARY GRADIENT
    primaryGradient: const AppGradient(
      start: Color(0xFF0E1137),
      end: Color(0xFF238FFF),
    ),

    /// SECONDARY GRADIENT (green → light green)
    secondaryGradient: const AppGradient(
      start: Color(0xFFFF34BF),
      end: Color(0xFF638BFE),
    ),

    /// OPACITY-BASED COLORS
    white: const OpacityShades(Color(0xFFFFFFFF)),
    black: const OpacityShades(Color(0xFF000000)),

    /// Card background base color (use opacity variants in UI)
    cardBg: const OpacityShades(Color(0xFF0B1C2D)),

    green: const Color(0xFF67FF8D),
    lightGreen: const Color(0x4067FF8D),

    orange: const Color(0xFFF2A33A),
  );

  static AppCoreTheme light = _core;
  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static void init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }
}
