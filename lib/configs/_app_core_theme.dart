part of 'configs.dart';

class OpacityShades {
  final Color base;

  const OpacityShades(this.base);

  Color shade(double opacity) => base.withValues(alpha: opacity);

  /// Optional predefined steps
  Color get s10 => base.withValues(alpha: 0.1);
  Color get s20 => base.withValues(alpha: 0.2);
  Color get s25 => base.withValues(alpha: 0.25);
  Color get s30 => base.withValues(alpha: 0.3);
  Color get s40 => base.withValues(alpha: 0.4);
  Color get s50 => base.withValues(alpha: 0.5);
  Color get s60 => base.withValues(alpha: 0.6);
  Color get s80 => base.withValues(alpha: 0.8);

  OpacityShades copyWith({Color? base}) {
    return OpacityShades(base ?? this.base);
  }
}

/// Gradient class
class AppGradient {
  final Color start;
  final Color end;

  const AppGradient({required this.start, required this.end});

  LinearGradient get gradient => LinearGradient(colors: [start, end]);

  AppGradient copyWith({Color? start, Color? end}) {
    return AppGradient(start: start ?? this.start, end: end ?? this.end);
  }
}

class AppCoreTheme {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color orange;
  final Color green;
  final Color lightGreen;
  final Color red;
  final Color textGrey;
  final Color blue;
  final Color searchfield;

  final AppGradient primaryGradient;
  final AppGradient secondaryGradient;

  /// Opacity-based colors
  final OpacityShades white;
  final OpacityShades black;
  final OpacityShades cardBg;
  final OpacityShades disabled;
  final OpacityShades chip;

  const AppCoreTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.orange,
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.white,
    required this.black,
    required this.cardBg,
    required this.green,
    required this.lightGreen,
    required this.red,
    required this.textGrey,
    required this.disabled,
    required this.blue,
    required this.searchfield,
    required this.chip,
  });

  AppCoreTheme copyWith({
    Color? primary,
    Color? secondary,
    Color? teriary,
    Color? orange,
    Color? green,
    Color? red,
    Color? textGrey,
    Color? lightGreen,
    Color? blue,
    Color? searchfield,

    AppGradient? primaryGradient,
    AppGradient? secondaryGradient,
    OpacityShades? white,
    OpacityShades? black,
    OpacityShades? cardBg,
    OpacityShades? disabled,
    OpacityShades? chip,
  }) {
    return AppCoreTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: teriary ?? tertiary,
      orange: orange ?? this.orange,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      white: white ?? this.white,
      black: black ?? this.black,
      cardBg: cardBg ?? this.cardBg,
      green: green ?? this.green,
      lightGreen: lightGreen ?? this.lightGreen,
      red: red ?? this.red,
      textGrey: textGrey ?? this.textGrey,
      disabled: disabled ?? this.disabled,
      blue: blue ?? this.blue,
      searchfield: searchfield ?? this.searchfield,
      chip: chip ?? this.chip,
    );
  }
}
