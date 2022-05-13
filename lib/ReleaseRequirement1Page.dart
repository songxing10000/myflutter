import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/MyAppBar.dart';

class ReleaseRequirement1Page extends StatefulWidget {
  const ReleaseRequirement1Page({Key? key}) : super(key: key);

  @override
  State<ReleaseRequirement1Page> createState() =>
      _ReleaseRequirement1PageState();
}

class _ReleaseRequirement1PageState extends State<ReleaseRequirement1Page> {
  @override
  Widget build(BuildContext context) {
    var mobielView = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 6, 12, 6),
      child: Row(children: [
        Image.asset('images/icon_shouji.png'),
        SizedBox(width: 10),
        const Text(
          '手机号',
          style: TextStyle(
              fontFamily: 'PingFangSC-Medium',
              fontSize: 16,
              color: Color(0xFF333333)),
        ),
        Spacer(),
        Expanded(
            child: TextField(
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: '请输入手机号',
            hintStyle: TextStyle(
              fontFamily: 'PingFangSC-Regular',
              fontSize: 16,
              color: Color(0xFF999999),
            ),
            border: InputBorder.none, // 不要底线
          ),
        )),
      ]),
    );
    var baseDemandInfoView = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Image.asset('images/icon_jichuxuqiu.png'),
              SizedBox(width: 10),
              const Text(
                '基础需求',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 16,
                    color: Color(0xFF333333)),
              ),
            ]),
            SizedBox(
              height: 17,
            ),
            Text(
              '需求标题',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            TextField(
              maxLines: null,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 13,
              ),
              decoration: InputDecoration(
                hintText: '请填写需求标题',
                hintStyle: TextStyle(
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 13,
                  color: Color(0xFF999999),
                ),
                border: InputBorder.none, // 不要底线
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              height: 1,
              color: Color(0xffF5F6FA),
            ),
            const SizedBox(height: 24),
            Text(
              '需求描述',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              maxLines: null,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 13,
              ),
              decoration: InputDecoration(
                hintText: '请填写需求描述',
                hintStyle: TextStyle(
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 13,
                  color: Color(0xFF999999),
                ),
                border: InputBorder.none, // 不要底线
              ),
            ),
          ],
        ));

    var detailDemandInfoView = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 20),
        child: Column(
          children: [
            Row(children: [
              Image.asset('images/icon_xingxixuqiuxinxi.png'),
              SizedBox(width: 10),
              const Text(
                '需求预算',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 16,
                    color: Color(0xFF333333)),
              ),
              Spacer(),
            ]),
            const SizedBox(height: 8),
          ],
        ));

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
                  Navigator.of(context).pushNamed('/ReleaseRequirement2Page');
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
          text: '完善基本信息',
          style: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 28,
              color: Color(0xFF303030))),
      TextSpan(
          text: '1',
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
              '信息越完善设计越精准',
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
                          mobielView,
                          const SizedBox(height: 12),
                          baseDemandInfoView,
                          const SizedBox(height: 12),
                          detailDemandInfoView,
                          const SizedBox(height: 12),
                        ],
                      ))),
              bottomActionView
            ])));
  }
}
