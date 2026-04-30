import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/models/game_schedule_model.dart';
import 'package:demo_app/models/player_stats_model.dart';
import 'package:demo_app/widgets/circle_avatar.dart';
import 'package:demo_app/widgets/core/app_background.dart';
import 'package:demo_app/widgets/core/app_bar/app_bar.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:demo_app/widgets/design/button/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

part 'widgets/_body.dart';
part 'state.dart';
part 'data.dart';
part 'widgets/helper_widgets.dart';
part 'widgets/tab_bar_section.dart';
part 'widgets/tabbar_views/schedule_view.dart';

class PlayerProfileScreen extends StatelessWidget {
  const PlayerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
