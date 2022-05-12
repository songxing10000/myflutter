import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/MyAppBar.dart';

class ReleaseRequirement4Page extends StatefulWidget {
  const ReleaseRequirement4Page({Key? key}) : super(key: key);

  @override
  State<ReleaseRequirement4Page> createState() =>
      _ReleaseRequirement4PageState();
}

class _ReleaseRequirement4PageState extends State<ReleaseRequirement4Page> {
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

    var mobielView = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
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
        const Spacer(),
        const Text(
          '15862345678',
          style: TextStyle(
              fontFamily: 'PingFangSC-Regular',
              fontSize: 16,
              color: Color(0xFF666666)),
        ),
        SizedBox(width: 12),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              '修改',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 14,
                  color: Color(0xFF3071F2)),
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
          children: [
            Row(children: [
              Image.asset('images/icon_jichuxuqiu.png'),
              SizedBox(width: 10),
              const Text(
                '基础需求信息',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 16,
                    color: Color(0xFF333333)),
              ),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    '修改',
                    style: TextStyle(
                        fontFamily: 'PingFangSC-Regular',
                        fontSize: 14,
                        color: Color(0xFF3071F2)),
                  )),
            ]),
            myCell(topM: 17, title: "需求标题", subTitle: "我需要LOGO设计"),
            myCell(
                topM: 24,
                title: "需求描述",
                subTitle:
                    "需求描述即阐述需求点，包括功能需求和非功能需求及其优先级，其中，非功能性的需求主要包括：安全需求、性能需求、兼容性需求、数据统计需求、帮助需求、财务需求、法律需求、运营需求、UI需求"),
            myCell(topM: 24, title: "需求类型", subTitle: "创意设计  |  LOGO设计"),
            myCell(topM: 24, title: "需求预算", subTitle: "可议价？", isLast: true),
            const SizedBox(height: 8),
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
                '详细需求信息',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 16,
                    color: Color(0xFF333333)),
              ),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    '修改',
                    style: TextStyle(
                        fontFamily: 'PingFangSC-Regular',
                        fontSize: 14,
                        color: Color(0xFF3071F2)),
                  )),
            ]),
            myCell(topM: 17, title: "优先联系方式", subTitle: "不限联系方式"),
            myCell(topM: 24, title: "偏好联系时间", subTitle: "无要求"),
            myCell(topM: 24, title: "反馈时间要求", subTitle: "不限联系时间"),
            myCell(topM: 24, title: "开票要求", subTitle: "无要求", isLast: true),
            const SizedBox(height: 8),
          ],
        ));

    var enterpriseInfoView = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 20),
        child: Column(children: [
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
            Spacer(),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '修改',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 14,
                      color: Color(0xFF3071F2)),
                )),
          ]),
          myCell(topM: 17, title: "主体性质", subTitle: "不知道写啥字段 随便吧", isLast: true)
        ]));
    Widget _alert(BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          '确认要提交此需求吗？',
          style: TextStyle(
              fontFamily: 'PingFangSC-Medium',
              fontSize: 16,
              color: Color(0xFF333333)),
        ),
        actions: <Widget>[
          CupertinoButton(
              child: Text(
                '取消',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 14,
                    color: Color(0xFF666666)),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          CupertinoButton(
              child: Text(
                '确认',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 14,
                    color: Color(0xFF4C87F1)),
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      );
    }

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
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return _alert(context);
                      });
                },
                child: const Text(
                  '确认提交',
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
          text: '确认需求信息 ',
          style: TextStyle(
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 28,
              color: Color(0xFF303030))),
      TextSpan(
          text: '4',
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
              '随后立即开始匹配服务商',
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
                          enterpriseInfoView
                        ],
                      ))),
              bottomActionView
            ])));
  }
}
