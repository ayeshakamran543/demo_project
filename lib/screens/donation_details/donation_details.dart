import 'dart:ui';

import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/models/recent_supporters_model.dart';
import 'package:demo_app/router/routes.dart';
import 'package:demo_app/widgets/circle_avatar.dart';
import 'package:demo_app/widgets/core/app_background.dart';
import 'package:demo_app/widgets/core/app_bar/app_bar.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:demo_app/widgets/design/button/app_button/app_button.dart';
import 'package:demo_app/widgets/design/cards/supporter_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

part 'widgets/_body.dart';
part 'data.dart';
part 'widgets/fund_rasing_card.dart';

class DonationDetailsScreen extends StatelessWidget {
  const DonationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return _Body();
  }
}
