import 'package:flutter/material.dart';
import 'package:myflutter/MyAppBar.dart';
import 'SelectStrsSheet.dart';
import 'SelectTimeSheet.dart';

// ignore: must_be_immutable
class ReleaseRequirement2Page extends StatefulWidget {
  /// 联系方式
  String ContactInfoTitle = '联系方式';
  List<String> ContactInfoStrs = ["隐私电话", "企业微信", "不限联系方式"];
  int ContactInfoSelectedIdx = 2;

  /// 偏好联系时间
  String preferredContactTimeTitile = '偏好联系时间';
  List<String> preferredContactTimeStrs = [
    "09:00-11:00",
    "11:00-13:00",
    "13:00-15:00",
    "15:00-17:00",
    "17:00-19:00",
    "不限联系时间"
  ];
  int preferredContactTimeSelectedIdx = 5;

  /// 开票要求
  String InvoicingTitle = '开票要求';
  List<String> InvoicingStrs = ["普通电子发票", "增值税专用发票", "无要求"];
  int InvoicingSelectedIdx = 2;

  /// 反馈时间要求
  String FeedbackTimeTitle = '反馈时间要求';
  List<String> FeedbackTimeStrs = ["不需要定期反馈", "需要定期反馈", "无要求"];
  int FeedbackTimeSelectedIdx = 2;
  ReleaseRequirement2Page({Key? key}) : super(key: key);

  @override
  State<ReleaseRequirement2Page> createState() =>
      _ReleaseRequirement2PageState();
}

class _ReleaseRequirement2PageState extends State<ReleaseRequirement2Page> {
  @override
  Widget build(BuildContext context) {
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
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      builder: (context) {
                        return SelectStrsSheet(
                          title: widget.ContactInfoTitle,
                          selecteStrs: widget.ContactInfoStrs,
                          selectedIdx: widget.ContactInfoSelectedIdx,
                          onTap: (int newSelectedIdx) {
                            setState(() {
                              widget.ContactInfoSelectedIdx = newSelectedIdx;
                            });
                          },
                        );
                      });
                },
                child: Row(
                  children: [
                    Text(
                      widget.ContactInfoStrs[widget.ContactInfoSelectedIdx],
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 13,
                          color: Color(0xFF999999)),
                    ),
                    Spacer(),
                    Image.asset('images/iconright.png'),
                  ],
                )),
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
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      builder: (context) {
                        return SelectTimeSheet(
                          title: widget.preferredContactTimeTitile,
                          selecteStrs: widget.preferredContactTimeStrs,
                          selectedIdx: widget.preferredContactTimeSelectedIdx,
                          onTap: (int newSelectedIndex) {
                            setState(() {
                              widget.preferredContactTimeSelectedIdx =
                                  newSelectedIndex;
                            });
                          },
                        );
                      });
                },
                child: Row(
                  children: [
                    Text(
                      widget.preferredContactTimeStrs[
                          widget.preferredContactTimeSelectedIdx],
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 13,
                          color: Color(0xFF999999)),
                    ),
                    Spacer(),
                    Image.asset('images/iconright.png'),
                  ],
                )),
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
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  builder: (context) {
                    return SelectStrsSheet(
                      title: widget.FeedbackTimeTitle,
                      selecteStrs: widget.FeedbackTimeStrs,
                      selectedIdx: widget.FeedbackTimeSelectedIdx,
                      onTap: (int newSelectedIndex) {
                        setState(() {
                          widget.FeedbackTimeSelectedIdx = newSelectedIndex;
                        });
                      },
                    );
                  });
            },
            child: Row(
              children: [
                Text(
                  widget.FeedbackTimeStrs[widget.FeedbackTimeSelectedIdx],
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 13,
                      color: Color(0xFF999999)),
                ),
                Spacer(),
                Image.asset('images/iconright.png'),
              ],
            ),
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
            '开票要求',
            style: TextStyle(
                fontFamily: 'PingFangSC-Medium',
                fontSize: 16,
                color: Color(0xFF333333)),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  builder: (context) {
                    return SelectStrsSheet(
                      title: widget.InvoicingTitle,
                      selecteStrs: widget.InvoicingStrs,
                      selectedIdx: widget.InvoicingSelectedIdx,
                      onTap: (int newSelectedIndex) {
                        setState(() {
                          widget.InvoicingSelectedIdx = newSelectedIndex;
                        });
                      },
                    );
                  });
            },
            child: Row(
              children: [
                Text(
                  widget.InvoicingStrs[widget.InvoicingSelectedIdx],
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 13,
                      color: Color(0xFF999999)),
                ),
                Spacer(),
                Image.asset('images/iconright.png'),
              ],
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
