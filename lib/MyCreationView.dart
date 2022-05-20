import 'package:flutter/material.dart';

/// 我的创作
class MyCreationView extends StatelessWidget {
  final VoidCallback callback;
  const MyCreationView({Key? key, required this.callback}) : super(key: key);
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
              '我的创作',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            SizedBox(
              height: 16,
            ),
            Row(children: [
              InkWell(
                onTap: callback,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('images/我的_主播中心.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '主播中心',
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 12,
                          color: Color(0xFF333333)),
                    ),
                  ],
                ),
              )
            ])
          ],
        ));
  }
}
