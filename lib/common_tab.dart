import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'custom_undertab_line.dart';

class ICThemeTab extends StatelessWidget {
  final Widget child;
  final double sideWidth;
  const ICThemeTab({Key? key, this.sideWidth = 3.0, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: AppTheme.theme.copyWith(
          tabBarTheme: TabBarTheme(
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
              ),
              unselectedLabelColor: Color(0xFF333333),
              labelStyle: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold),
              labelColor: Color(0xff1c6eee),
              indicator: CustomUnderlineTabIndicator(
                  borderSide: BorderSide(
                color: Color(0xff1c6eee),
                width: this.sideWidth,
              )),
              indicatorSize: TabBarIndicatorSize.label),
        ),
        child: Container(
          child: child,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFFf2f3f4), width: 0.5))),
        ));
  }
}
