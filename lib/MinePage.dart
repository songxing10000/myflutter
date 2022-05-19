import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 购物包
    var gwbView = Container(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我的购物包',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                Column(
                  children: [
                    Image.asset('images/收藏.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '购物车',
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 12,
                          color: Color(0xFF333333)),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset('images/待支付.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '待付款',
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 12,
                          color: Color(0xFF333333)),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset('images/支付(1).png'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '已购商品',
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 12,
                          color: Color(0xFF333333)),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset('images/全部订单.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '我的订单',
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 12,
                          color: Color(0xFF333333)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 11,
                )
              ],
            )
          ],
        ));
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: Color(0xffF7F7F7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, // 宽度拉伸

          children: [
            Stack(alignment: Alignment.center, children: [
              Image.asset(
                "images/我的顶部背景.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 120.0 / 375.0,
              ),
              Row(children: [
                SizedBox(
                  width: 16,
                ),
                Image.asset('images/头像.png'),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '登录/注册',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Medium',
                      fontSize: 18,
                      color: Color(0xFFFFFFFF)),
                ),
                Spacer(),
                Container(
                    // width:87,
                    // height:24,
                    padding: EdgeInsets.fromLTRB(24, 6, 24, 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        bottomLeft: const Radius.circular(16.0),
                      ),
                      color: Color(0x80FFFFFF),
                    ),
                    child: Text(
                      '积分 0',
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 14,
                          color: Color(0xFFFFFFFF)),
                    )),
              ])
            ]),
            Container(
                color: Color(0xffF7F7F7),
                padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: Column(
                  children: [
                    gwbView,
                    SizedBox(
                      height: 10,
                    ),
                    gwbView,
                    SizedBox(
                      height: 10,
                    ),
                    gwbView,
                  ],
                ))
          ]),
    )));
  }
}
