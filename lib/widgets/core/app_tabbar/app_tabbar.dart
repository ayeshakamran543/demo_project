import 'package:demo_app/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientTabSection extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;
  final List<Widget> tabViews;

  const GradientTabSection({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.tabViews,
  }) : assert(
         tabs.length == tabViews.length,
         'tabs and tabViews must have same length',
       );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildTabBar(), _buildTabContent()],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0x2ED9D9D9), width: 2.w),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: List.generate(tabs.length, (i) {
            final selected = selectedIndex == i;

            return GestureDetector(
              onTap: () => onTabChanged(i),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    child: Text(tabs[i], style: AppText.b1bm),
                  ),

                  /// Gradient indicator
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: 2.h,
                    width: selected ? 90.w : 0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.c.secondaryGradient.end,
                          AppTheme.c.secondaryGradient.start,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return tabViews[selectedIndex];
  }
}
