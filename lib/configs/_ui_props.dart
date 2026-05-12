part of 'configs.dart';

abstract class UIProps {
  // Animations
  static Duration duration0 = const Duration(milliseconds: 150);
  static Duration duration = const Duration(milliseconds: 280);
  static Duration duration2 = const Duration(milliseconds: 400);

  // Paddings
  static EdgeInsets? btnPadMed;
  static EdgeInsets? btnPadSm;

  // Radius
  static double radius = 15;
  static BorderRadius? tabRadius;
  static BorderRadius? buttonRadius;
  static BorderRadius? radiusS;
  static BorderRadius? radiusM;
  static BorderRadius? radiusL;
  static BorderRadius? radiusXL;
  static BoxDecoration? borderButton;
  static BorderRadius? topBoth15;
  static BorderRadius? topBoth20;

  // Shadows
  static List<BoxShadow>? cardShadow;
  static List<BoxShadow>? buttonShadow;
  static List<BoxShadow>? redShadow;
  // BoxDecoration
  static BoxDecoration? boxCard;
  static BoxDecoration? popupCard;
  static Gradient? primaryGradient;
  static Gradient? secondaryGradient;

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(402, 874));

    initRadius(context);
    initButtons();
    initShadows();
    initBoxDecorations();
    initGradient(context);
  }

  static void initRadius(BuildContext context) {
    tabRadius = BorderRadius.circular(radius * 2);
    buttonRadius = BorderRadius.circular(ScreenUtil().radius(8));

    radiusS = BorderRadius.circular(ScreenUtil().radius(8));
    radiusM = BorderRadius.circular(ScreenUtil().radius(16));
    radiusL = BorderRadius.circular(ScreenUtil().radius(24));
    radiusXL = BorderRadius.circular(ScreenUtil().radius(45));
    topBoth15 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(15)),
      topRight: Radius.circular(ScreenUtil().radius(15)),
    );
    topBoth20 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(20)),
      topRight: Radius.circular(ScreenUtil().radius(20)),
    );
  }

  static void initButtons() {
    borderButton = BoxDecoration(
      borderRadius: UIProps.buttonRadius,
      border: Border.all(width: 1.4, color: AppTheme.c.primary),
    );
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 2,
      vertical: AppDimensions.padding! * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 3,
      vertical: AppDimensions.padding! * 1.5,
    );
  }

  static void initShadows() {
    cardShadow = [
      BoxShadow(color: Color(0x0F0D0D12), blurRadius: 2, offset: Offset(0, 1)),
    ];
    buttonShadow = [
      BoxShadow(
        color: Color(0x8F8E43EF),
        blurRadius: 20.7,
        offset: const Offset(0, 0),
      ),
    ];
    redShadow = [
      BoxShadow(
        color: Color(0x8FF65555),
        blurRadius: 20.7,
        offset: Offset(0, 0),
      ),
    ];
  }

  static void initBoxDecorations() {
    boxCard = BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: AppTheme.c.white.base,
    );
  }

  static void initGradient(BuildContext context) {
    primaryGradient = LinearGradient(
      transform: GradientRotation(58.65 * 3.14159265 / 180),
      colors: [
        Color(0xB20E1137), // rgba(14, 17, 55, 0.70)
        Color(0xB2238FFF), // rgba(35, 143, 255, 0.70)
      ],
      stops: [0.0, 1.0], // stops clamped; CSS out-of-range values
    );
    secondaryGradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF638BFE), Color(0xFFFF34BF), Color(0xFFFF34BF)],
      stops: [0.0, 0.7, 1.0],
    );
  }
}
