import 'package:flutter/material.dart';
import 'package:myflutter/MyToolkitView.dart';
import 'MineType1View.dart';
import 'MineType2View.dart';
import 'MyWalletView.dart';
import 'MyCreationView.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: Color(0xffF7F7F7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, // 宽度拉伸

          children: [
            Stack(alignment: Alignment.bottomLeft, children: [
              Image.asset(
                "images/我的顶部背景.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 120.0 / 375.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 26),
                child: Row(children: [
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
                ]),
              )
            ]),
            Container(
                color: Color(0xffF7F7F7),
                padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: Column(
                  children: [
                    MineType1View(title: '我的购物包', names: [
                      '购物车',
                      '待支付',
                      '已购商品',
                      '我的订单'
                    ], imgNames: [
                      '我的_购物车',
                      '我的_待支付',
                      '我的_已购商品',
                      '我的_我的订单'
                    ], callbacks: [
                      () {},
                      () {},
                      () {},
                      () {},
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    MineType1View(title: '我的学习包', names: [
                      '课程收藏',
                      '待支付',
                      '已支付',
                      '全部订单'
                    ], imgNames: [
                      '收藏',
                      '待支付',
                      '支付(1)',
                      '全部订单'
                    ], callbacks: [
                      () {},
                      () {},
                      () {},
                      () {},
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    MineType2View(title: '我的任务包', names: [
                      '学习任务',
                      '考试任务',
                      '练习任务',
                    ], imgNames: [
                      '学习任务',
                      '考试任务',
                      '练习任务',
                    ], callbacks: [
                      () {},
                      () {},
                      () {},
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    MyWalletView(title: '我的钱包', names: [
                      '奖学金(元)',
                      '佣金收益(元)',
                    ], amountOfMoneys: [
                      '455.00',
                      '1995.00',
                    ], callbacks: [
                      () {},
                      () {},
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    MyCreationView(callback: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    MyToolkitView(title: '我的工具包', names: [
                      '快速查询',
                      '天气查询',
                      '充值服务',
                      '垃圾分类',
                      '实时路况',
                      '交通运输',
                      '机票',
                      '火车票',
                      '反馈',
                      '设置',
                    ], imgNames: [
                      '我的_快速查询',
                      '我的_天气查询',
                      '我的_充值服务',
                      '我的_垃圾分类',
                      '我的_实时路况',
                      '我的_交通运输',
                      '我的_机票',
                      '我的_火车票',
                      '我的_反馈',
                      '我的_设置',
                    ], callbacks: [
                      () {},
                      () {},
                      () {},
                      () {},
                      () {},
                      () {},
                      () {},
                      () {},
                      () {},
                      () {},
                    ]),
                    SizedBox(
                      height: 53,
                    )
                  ],
                ))
          ]),
    )));
  }
}
// 