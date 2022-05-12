import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'MyAppBar.dart';
import 'CheckCell.dart';

class CancelDemandPage extends StatefulWidget {
  const CancelDemandPage({Key? key}) : super(key: key);

  @override
  State<CancelDemandPage> createState() => _CancelDemandPageState();
}

class _CancelDemandPageState extends State<CancelDemandPage> {
  @override
  Widget build(BuildContext context) {
    var topView = Container(
      height: 120,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 21),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset('images/pic_kefu.png'),
        SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '您为什么要取消需求？',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Semibold,PingFang SC',
                  fontSize: 22,
                  color: Color(0xFF303030)),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              '请告知取消原因，我们将努力改善！',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Regular',
                  fontSize: 12,
                  color: Color(0xFF333333)),
              textAlign: TextAlign.left,
            ),
          ],
        )
      ]),
    );
    return Scaffold(
        appBar: MyAppBar(context: context, titleStr: '取消需求'),
        body: Container(
          color: const Color(0xFFF7F7F7),
          child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                topView,
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '平台相关',
                          style: TextStyle(
                              fontFamily: 'PingFangSC-Medium',
                              fontSize: 16,
                              color: Color(0xFF333333)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CheckCell(title: "响应时间过长", isSelected: true),
                        SizedBox(
                          height: 20,
                        ),
                        HLine(),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '自己的原因',
                          style: TextStyle(
                              fontFamily: 'PingFangSC-Medium',
                              fontSize: 16,
                              color: Color(0xFF333333)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CheckCell(title: "我想重新发布需求", isSelected: false),
                        SizedBox(
                          height: 16,
                        ),
                        CheckCell(title: "暂时不做此需求", isSelected: false),
                        SizedBox(
                          height: 20,
                        ),
                        HLine(),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '其他',
                          style: TextStyle(
                              fontFamily: 'PingFangSC-Medium',
                              fontSize: 16,
                              color: Color(0xFF333333)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CheckCell(title: "其他原因", isSelected: false),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF7F7F7),
                            ),
                            child: TextField(
                              // controller:
                              //     controller.feedbackContentController,
                              // focusNode:
                              //     controller.feedbackContentFocusNode,
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 16,
                              ),
                              maxLength: 200,
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                hintText: "请输入取消需求的原因",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.transparent),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.transparent),
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: 'PingFangSC-Regular',
                                  fontSize: 14,
                                  color: Color(0xFF999999),
                                ),
                              ),
                              textInputAction: TextInputAction.newline,
                              // maxLength: 200,
                              // maxLines: 5,

                              // buildCounter: _buildCount,
                            ))
                      ],
                    ),
                  ),
                ),
              ]),
            )),
            Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF79A2F2),
                              Color(0xFF3071F2)
                            ])),
                        child: TextButton(
                            onPressed: () {
                              showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return _alert(context);
                                  });
                            },
                            child: const Text(
                              '取消需求',
                              style: TextStyle(
                                  fontFamily: 'PingFangSC-Regular',
                                  fontSize: 16,
                                  color: Colors.white),
                            )))),
                Container(
                  height: MediaQuery.of(context).padding.bottom,
                  color: Colors.white,
                )
              ],
            )
          ]),
        ));
  }

  Widget _alert(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        '确认要取消此需求吗？',
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
}

class HLine extends StatelessWidget {
  const HLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      // color: Colors.red,
      child: Divider(
        thickness: 1,
        indent: 0,
        endIndent: 0,
        color: Color(0xFFF5F6FA),
      ),
    );
  }
}
