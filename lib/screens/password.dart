import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_background.dart';
import 'package:demo_app/widgets/design/app_textfield/app_textfield.dart';
import 'package:demo_app/widgets/design/button/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool get _canContinue =>
      _passwordController.text.length >= 8 &&
      _confirmController.text == _passwordController.text;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      body: AppBackground(
        includeTopPadding: true,
        backgroundImage: 'assets/pngs/auth_bg.png',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,

                  // Password field
                  AppTextField(
                    name: 'Password',
                    controller: _passwordController,
                    type: TextFieldType.withLableOnly,
                    label: 'Password',
                    hint: 'Your password',
                    isPass: true,
                    onChanged: (_) => setState(() {}),
                  ),

                  24.verticalSpace,

                  // Confirm password field
                  AppTextField(
                    name: 'ConfirmPassword',
                    controller: _confirmController,
                    type: TextFieldType.withLableOnly,
                    label: 'Confirm password',
                    hint: 'Confirm your password',
                    isPass: true,
                    onChanged: (_) => setState(() {}),
                  ),

                  8.verticalSpace,

                  // Hint
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Minimum 8 characters',
                      style: AppText.b2?.cl(AppTheme.c.white.s60),
                    ),
                  ),

                  const Spacer(),

                  // Continue button
                  AppButton(
                    label: 'Continue',
                    isDisabled: !_canContinue,
                    onPressed: () {},
                  ),

                  24.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
