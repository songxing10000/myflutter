import 'dart:math';

import 'package:flutter/material.dart';

class MineType2View extends StatelessWidget {
  final String title;
  final List<String> names;
  final List<String> imgNames;
  final List<VoidCallback> callbacks;
  const MineType2View(
      {Key? key,
      required this.title,
      required this.names,
      required this.imgNames,
      required this.callbacks})
      : super(key: key);

  List<Widget> makeRows() {
    List<Widget> rowViews = [];
    rowViews.add(SizedBox(
      width: 6,
    ));
    int cnt = min(3, names.length);
    for (int i = 0; i < cnt; i++) {
      InkWell well = InkWell(
        onTap: callbacks[i],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/${imgNames[i]}.png'), // 字符串占位
            SizedBox(
              width: 10,
            ),
            Text(
              names[i],
              style: TextStyle(
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 12,
                  color: Color(0xFF333333)),
            ),
          ],
        ),
      );
      rowViews.add(well);
      if (i < names.length - 1) {
        rowViews.add(Spacer());
      }
    }
    rowViews.add(SizedBox(
      width: 6,
    ));
    return rowViews;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xffEEEEEE), //边框颜色
              width: 1 //边框宽度
              ),
          borderRadius: BorderRadius.circular(12), // 圆角
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6, //阴影blur
              spreadRadius: 1, //阴影offset y
              color: Color(0x1C000000), //阴影颜色
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            SizedBox(
              height: 16,
            ),
            Row(children: makeRows())
          ],
        ));
  }
}
