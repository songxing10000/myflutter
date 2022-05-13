import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectTimeSheet extends StatefulWidget {
  /// 回调外面，当前选择的哪个联系方式
  void Function(int newSelectedIdx) onTap;
  String title;
  List<String> selecteStrs;
  int selectedIdx;
  SelectTimeSheet(
      {Key? key,
      required this.title,
      required this.selecteStrs,
      required this.selectedIdx,
      required this.onTap})
      : super(key: key);

  @override
  State<SelectTimeSheet> createState() => _SelectTimeSheetState();
}

class _SelectTimeSheetState extends State<SelectTimeSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
      child: Column(
          mainAxisSize: MainAxisSize.min, //sheet高度自适应
          crossAxisAlignment: CrossAxisAlignment.stretch, // 宽度拉伸
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Medium',
                      fontSize: 16,
                      color: Color(0xFF333333)),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      // dismiss sheet
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset('images/icon_close.png')),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ListView.builder(
                physics: new NeverScrollableScrollPhysics(), // 禁止滚动
                shrinkWrap: true, // 这个属性很重要
                itemCount: widget.selecteStrs.length,
                itemBuilder: (context, index) {
                  String selecteStr = widget.selecteStrs[index];

                  return InkWell(
                      onTap: () {
                        setState(() {
                          widget.selectedIdx = index;
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                selecteStr,
                                style: TextStyle(
                                    fontFamily: 'PingFangSC-Regular',
                                    fontSize: 14,
                                    color: index == widget.selectedIdx
                                        ? Color(0xFF4C87F1)
                                        : Color(0xFF333333)),
                              ),
                              Spacer(),
                              Image.asset(widget.selectedIdx != index
                                  ? 'images/icon_weixuanzhong.png'
                                  : 'images/icon_xuanzhong.png'),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xffF5F6FA),
                          )
                        ],
                      ));
                }),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xFF79A2F2), Color(0xFF3071F2)])),
              child: TextButton(
                onPressed: () {
                  widget.onTap(widget.selectedIdx);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '确认',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).padding.bottom,
              color: Color(0xFFFFFFFF),
            ),
          ]),
    );
  }
}
