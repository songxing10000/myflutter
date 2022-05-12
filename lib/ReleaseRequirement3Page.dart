import 'package:flutter/material.dart';
import 'package:myflutter/MyAppBar.dart';
import 'CheckCell.dart';

class ReleaseRequirement3Page extends StatefulWidget {
  const ReleaseRequirement3Page({Key? key}) : super(key: key);

  @override
  State<ReleaseRequirement3Page> createState() =>
      _ReleaseRequirement3PageState();
}

class _ReleaseRequirement3PageState extends State<ReleaseRequirement3Page> {
  /// 是企业
  bool isEnterprise = true;

  @override
  Widget build(BuildContext context) {
    var enterpriseInfoView = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Image.asset('images/icon_qiyexinxi.png'),
            SizedBox(width: 10),
            const Text(
              '企业信息',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 16,
                  color: Color(0xFF333333)),
            ),
          ]),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              CheckCell(
                  imgLeftMargin: 12,
                  imgTitleMargin: 8,
                  title: '企业',
                  isSelected: isEnterprise,
                  onTap: () {
                    setState(() {
                      isEnterprise = true;
                    });
                  }),
              SizedBox(
                width: 48,
              ),
              CheckCell(
                  imgLeftMargin: 12,
                  imgTitleMargin: 8,
                  title: '个人',
                  isSelected: !isEnterprise,
                  onTap: () {
                    setState(() {
                      isEnterprise = false;
                    });
                  }),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            isEnterprise ? '企业名称' : '称呼方式',
            style: TextStyle(
                fontFamily: 'PingFangSC-Medium',
                fontSize: 16,
                color: Color(0xFF333333)),
          ),
          TextField(
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: isEnterprise ? '请填写企业名称' : '王先生',
              hintStyle: TextStyle(
                fontFamily: 'PingFangSC-Regular',
                fontSize: 13,
                color: Color(0xFF666666),
              ),
              border: InputBorder.none, // 不要底线
            ),
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
                  Navigator.of(context).pushNamed('/ReleaseRequirement4Page');
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
          text: '完善企业信息',
          style: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 28,
              color: Color(0xFF303030))),
      TextSpan(
          text: '3',
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
                '增加需求可信度可让服务商更快的\n响应你的需求',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 14,
                    color: Color(0xFF333333)),
              ),
            ]),
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
                        children: [enterpriseInfoView],
                      ))),
              bottomActionView
            ])));
  }
}
