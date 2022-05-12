import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String titleStr;
  final VoidCallback? leftOnPressed;
  final bool hideBackIcon;
  final BuildContext context;
  MyAppBar(
      {Key? key,
      required this.context,
      required this.titleStr,
      this.leftOnPressed = null,
      this.hideBackIcon = false})
      : super(
            backgroundColor: Colors.white,
            title: Text(
              titleStr,
              style: const TextStyle(
                  fontFamily: 'PingFangSC-Semibold',
                  fontSize: 18,
                  color: Color(0xFF333333)),
            ),
            elevation: 0, //去掉Appbar底部阴影
            leading: hideBackIcon
                ? null
                : IconButton(
                    icon: Image.asset('images/nav_icon_back_black.png'),
                    onPressed: () {
                      if (leftOnPressed != null) {
                        leftOnPressed();
                        return;
                      }
                      Navigator.of(context).pop();
                    },
                  ));
}
