import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/screens/verification_screen.dart';
import 'package:demo_app/widgets/bottom_sheets/legal_bottom_sheets.dart';
import 'package:demo_app/widgets/core/app_background.dart';
import 'package:demo_app/widgets/design/app_textfield/app_textfield.dart';
import 'package:demo_app/widgets/design/button/app_button/app_button.dart';
import 'package:demo_app/widgets/design/button/auth_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        includeTopPadding: true,
        backgroundImage: 'assets/pngs/auth_bg.png',

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            39.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/logo.svg',
                  height: 20.h,
                  width: 23.w,
                ),
                6.horizontalSpace,
                SvgPicture.asset(
                  'assets/svgs/logo_text.svg',
                  height: 20.h,
                  width: 145.w,
                ),
              ],
            ),
            24.verticalSpace,
            Text(
              'Where Fans Fuel\n The Game.',
              style: AppText.h1xb!.s(56.sp).copyWith(height: 1.2),
            ),
            Text(
              'Support Your Team. Capture the Game. Turn Moments Into Memories.',
              style: AppText.b1!,
            ),
            24.verticalSpace,
            AppTextField(
              name: 'Email',
              type: TextFieldType.withLableOnly,
              label: 'Email',
              hint: 'Your email',
            ),
            24.verticalSpace,
            AppButton(
              label: 'Sign Up',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        VerificationScreen(email: 'jason@dimedroppers.com'),
                  ),
                );
              },
            ),
            24.verticalSpace,
            Row(
              children: [
                Text('Already have an account?', style: AppText.b1),
                8.horizontalSpace,
                Text(
                  'Log In',
                  style: AppText.b1bm!.w(6).cl(AppTheme.c.white.base),
                ),
              ],
            ),
            24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Container(height: 1.h, color: AppTheme.c.white.s25),
                ),
                16.horizontalSpace,
                Text('Or', style: AppText.b1),
                16.horizontalSpace,
                Expanded(
                  child: Container(height: 1.h, color: AppTheme.c.white.s25),
                ),
              ],
            ),
            24.verticalSpace,
            AuthButton(
              label: 'Continue with Google',
              onTap: () {},
              iconPath: 'assets/svgs/Google.svg',
            ),
            16.verticalSpace,
            AuthButton(
              label: 'Continue with Apple',
              onTap: () {},
              iconPath: 'assets/svgs/Apple.svg',
            ),
            24.verticalSpace,
            Text.rich(
              TextSpan(
                text: 'By signing up to the Dime Droppers, you agree with ',
                style: AppText.b2,
                children: [
                  TextSpan(
                    text: 'Terms of Use',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Show Terms of Use
                        LegalBottomSheet.showTerms(context);
                      },
                    style: AppText.b2bm!
                        .w(6)
                        .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppTheme.c.white.base,
                        ),
                  ),
                  TextSpan(text: ' and ', style: AppText.b2),
                  TextSpan(
                    text: 'Privacy Policy',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Show Privacy Policy
                        LegalBottomSheet.showPrivacyPolicy(context);
                      },
                    style: AppText.b2bm!
                        .w(6)
                        .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppTheme.c.white.base,
                        ),
                  ),

                  TextSpan(text: '.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
