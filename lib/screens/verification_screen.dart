import 'dart:async';

import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_background.dart';
import 'package:demo_app/widgets/core/app_bar/app_bar.dart';
import 'package:demo_app/widgets/design/app_textfield/otp_field.dart';
import 'package:demo_app/widgets/design/button/small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _secondsRemaining = 14 * 60 + 59;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsRemaining <= 0) {
        t.cancel();
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  String get _timerLabel {
    final m = _secondsRemaining ~/ 60;
    final s = _secondsRemaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  void _verifyOtp(String otp) {
    debugPrint('Verifying OTP: $otp');
  }

  void _onResend() {
    _timer?.cancel();

    setState(() {
      _secondsRemaining = 14 * 60 + 59;
    });

    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      appBar: CustomAppBar(type: AppBarType.logo),
      body: AppBackground(
        includeTopPadding: true,
        backgroundImage: 'assets/pngs/auth_bg.png',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,

            Text(
              'We sent code to ${widget.email},\nplease check your inbox.',
              style: AppText.b1bm,
            ),

            24.verticalSpace,

            /// ✅ Custom OTP Widget
            OtpField(length: 6, onCompleted: _verifyOtp),

            24.verticalSpace,

            Text(
              'The code will expire in $_timerLabel',
              style: AppText.l1?.cl(AppTheme.c.white.s50),
            ),

            24.verticalSpace,

            Text(
              "Didn't receive the code?",
              style: AppText.b1bm?.cl(AppTheme.c.white.base),
            ),

            24.verticalSpace,

            SmallButton(label: 'Resend Code', onTap: _onResend),

            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
