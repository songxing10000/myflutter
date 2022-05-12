import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/MyAppBar.dart';

class ReleaseRequirement2Page extends StatefulWidget {
  const ReleaseRequirement2Page({Key? key}) : super(key: key);

  @override
  State<ReleaseRequirement2Page> createState() =>
      _ReleaseRequirement2PageState();
}

class _ReleaseRequirement2PageState extends State<ReleaseRequirement2Page> {
  @override
  Widget build(BuildContext context) {
    Widget myCell(
        {required double topM,
        required String title,
        required String subTitle,
        bool isLast = false}) {
      return Column(
        children: [
          SizedBox(height: topM),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'PingFangSC-Medium,PingFang SC',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    subTitle,
                    style: const TextStyle(
                        fontFamily: 'PingFangSC-Regular,PingFang SC',
                        fontSize: 16,
                        color: Color(0xFF666666)),
                    maxLines: 10,
                  )),
            )
          ]),
          const SizedBox(height: 12),
          // 这里，这个，if一行语句，不错
          if (!isLast) Container(color: const Color(0xFFF7F7F7), height: 1)
        ],
      );
    }

    var detailDemandInfoView = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Image.asset('images/icon_xingxixuqiuxinxi.png'),
              SizedBox(width: 10),
              const Text(
                '偏好要求',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 16,
                    color: Color(0xFF333333)),
              ),
              Spacer(),
            ]),
            SizedBox(
              height: 17,
            ),
            Text(
              '联系方式',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  '不限联系方式',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 13,
                      color: Color(0xFF999999)),
                ),
                Spacer(),
                Image.asset('images/iconright.png'),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                // width:319,
                height: 1,
                // padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
                color: Color(0xFFF5F6FA)),
            SizedBox(
              height: 24,
            ),
            Text(
              '联系时间',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  '不限联系时间',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 13,
                      color: Color(0xFF999999)),
                ),
                Spacer(),
                Image.asset('images/iconright.png'),
              ],
            ),
          ],
        ));

    var enterpriseInfoView = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Image.asset('images/icon_jiaofuyaoqiu.png'),
            SizedBox(width: 10),
            const Text(
              '交付要求',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            Spacer(),
          ]),
          SizedBox(
            height: 17,
          ),
          Text(
            '反馈时间要求',
            style: TextStyle(
                fontFamily: 'PingFangSC-Medium',
                fontSize: 16,
                color: Color(0xFF333333)),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                '无要求',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 13,
                    color: Color(0xFF999999)),
              ),
              Spacer(),
              Image.asset('images/iconright.png'),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
              // width:319,
              height: 1,
              // padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
              color: Color(0xFFF5F6FA)),
          SizedBox(
            height: 24,
          ),
          Text(
            '开票时间',
            style: TextStyle(
                fontFamily: 'PingFangSC-Medium',
                fontSize: 16,
                color: Color(0xFF333333)),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                '无要求',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 13,
                    color: Color(0xFF999999)),
              ),
              Spacer(),
              Image.asset('images/iconright.png'),
            ],
          ),
        ]));

    var bottomActionView = Column(
      children: [
        Container(
          height: 50,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(children: [
            OutlinedButton(
              onPressed: null,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(39, 0, 39, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              child: const Text(
                '上一步',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 16,
                    color: Color(0xFF666666)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xFF79A2F2), Color(0xFF3071F2)])),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ReleaseRequirement3Page');
                },
                child: const Text(
                  '下一步',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ))
          ]),
        ),
        Container(
          height: MediaQuery.of(context).padding.bottom,
          color: Colors.white,
        )
      ],
    );
    // 富文本
    InlineSpan span = TextSpan(children: [
      TextSpan(
          text: '完善详细信息',
          style: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 28,
              color: Color(0xFF303030))),
      TextSpan(
          text: '2',
          style: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 32,
              color: Color(0xFF3071F2))),
      TextSpan(
          text: '/',
          style: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 16,
              color: Color(0xFF3071F2))),
      TextSpan(
          text: '4',
          style: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 16,
              color: Color(0xFF333333))),
    ]);
    var richText = Text.rich(span);
    var topView = Container(
      height: 120,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 21),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            richText,
            SizedBox(
              height: 9,
            ),
            Text(
              '方便服务商更好的提供服务',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 14,
                  color: Color(0xFF333333)),
            ),
          ],
        ),
        Spacer(),
        Image.asset('images/暂无订单信息.png'),
      ]),
    );
    return Scaffold(
        appBar: MyAppBar(context: context, titleStr: '发布需求'),
        body: Container(
            color: const Color(0xFFF7F7F7),
            child: Column(children: [
              topView,
              Expanded(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          detailDemandInfoView,
                          const SizedBox(height: 12),
                          enterpriseInfoView
                        ],
                      ))),
              bottomActionView
            ])));
  }
}
