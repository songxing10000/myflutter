import 'package:flutter/material.dart';

/// 我的工具包
class MyToolkitView extends StatelessWidget {
  final String title;
  final List<String> names;
  final List<String> imgNames;
  final List<VoidCallback> callbacks;
  const MyToolkitView(
      {Key? key,
      required this.title,
      required this.names,
      required this.imgNames,
      required this.callbacks})
      : super(key: key);
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
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(), // 禁止滚动

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 横轴三个子widget
                mainAxisSpacing: 24,
                crossAxisSpacing: 40,
              ),
              itemCount: names.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: callbacks[index],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/${imgNames[index]}.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        names[index],
                        style: TextStyle(
                            fontFamily: 'PingFangSC-Regular',
                            fontSize: 12,
                            color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
