part of 'configs.dart';

class AppText {
  static TextStyle? btn;
  // Headings
  static TextStyle? h1; // Base weight
  static TextStyle? h1b; // Bold
  static TextStyle? h1bm; // Medium
  static TextStyle? h1xb; // Extra bold
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h2bm;
  static TextStyle? h2xb;
  static TextStyle? h3;
  static TextStyle? h3b;
  static TextStyle? h3bm;
  static TextStyle? h3xb;
  static TextStyle? h4;
  static TextStyle? h4b;
  static TextStyle? h4bm;
  static TextStyle? h4xb;
  static TextStyle? h5;
  static TextStyle? h5b;
  static TextStyle? h5bm;
  static TextStyle? h5xb;
  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b1bm;
  static TextStyle? b1xb;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b2bm;
  static TextStyle? b2xb;
  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l1bm;
  static TextStyle? l1xb;
  static TextStyle? l2;
  static TextStyle? l2b;
  static TextStyle? l2bm;
  static TextStyle? l2xb;

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(402, 874));
    const b = FontWeight.bold;
    const xb = FontWeight.w800; // Extra bold

    // BASE STYLES
    final TextStyle headingBase = TextStyle(
      fontFamily: headingFontFamily,
      color: AppTheme.c.white.base,
      letterSpacing: 0,
    );
    final TextStyle bodyBase = TextStyle(
      fontFamily: bodyFontFamily,
      color: AppTheme.c.white.base,
      letterSpacing: 0,
    );

    // ---------------- HEADINGS ----------------
    h1 = headingBase.copyWith(fontSize: 32.h);
    h1b = h1!.copyWith(fontWeight: b);
    h1bm = h1!.copyWith(fontWeight: FontWeight.w500);
    h1xb = h1!.copyWith(fontWeight: xb);

    h2 = headingBase.copyWith(fontSize: 28.h);
    h2b = h2!.copyWith(fontWeight: b);
    h2bm = h2!.copyWith(fontWeight: FontWeight.w500);
    h2xb = h2!.copyWith(fontWeight: xb);

    h3 = headingBase.copyWith(fontSize: 24.h, height: 1.2);
    h3b = h3!.copyWith(fontWeight: b);
    h3bm = h3!.copyWith(fontWeight: FontWeight.w500);
    h3xb = h3!.copyWith(fontWeight: xb);

    h4 = headingBase.copyWith(fontSize: 20.h, height: 1.4);
    h4b = h4!.copyWith(fontWeight: b);
    h4bm = h4!.copyWith(fontWeight: FontWeight.w500);
    h4xb = h4!.copyWith(fontWeight: xb);

    h5 = headingBase.copyWith(fontSize: 16.h, height: 1.4);
    h5b = h5!.copyWith(fontWeight: b);
    h5bm = h5!.copyWith(fontWeight: FontWeight.w500);
    h5xb = h5!.copyWith(fontWeight: xb);

    // ---------------- BODY ----------------
    b1 = bodyBase.copyWith(fontSize: 16.h, height: 1.4);
    b1b = b1!.copyWith(fontWeight: b);
    b1bm = b1!.copyWith(fontWeight: FontWeight.w500);
    b1xb = b1!.copyWith(fontWeight: xb);

    b2 = bodyBase.copyWith(fontSize: 14.h, height: 1.4);
    b2b = b2!.copyWith(fontWeight: b);
    b2bm = b2!.copyWith(fontWeight: FontWeight.w500);
    b2xb = b2!.copyWith(fontWeight: xb);

    // ---------------- LABELS ----------------
    l1 = bodyBase.copyWith(fontSize: 12.h);
    l1b = l1!.copyWith(fontWeight: b);
    l1bm = l1!.copyWith(fontWeight: FontWeight.w500);
    l1xb = l1!.copyWith(fontWeight: xb);

    l2 = bodyBase.copyWith(fontSize: 10.h);
    l2b = l2!.copyWith(fontWeight: b);
    l2bm = l2!.copyWith(fontWeight: FontWeight.w500);
    l2xb = l2!.copyWith(fontWeight: xb);
  }
}
