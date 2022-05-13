import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectStrsSheet extends StatelessWidget {
  /// 回调外面，当前选择的哪个联系方式
  void Function(int newSelectedIdx) onTap;
  String title;
  List<String> selecteStrs;
  int selectedIdx;
  SelectStrsSheet(
      {Key? key,
      required this.title,
      required this.selecteStrs,
      required this.selectedIdx,
      required this.onTap})
      : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
      child: Column(mainAxisSize: MainAxisSize.min, //sheet高度自适应
          children: [
            Row(
              children: [
                Text(
                  title,
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
                shrinkWrap: true, // 这个属性很重要
                itemCount: selecteStrs.length,
                itemBuilder: (context, index) {
                  String selecteStr = selecteStrs[index];

                  return TextButton(
                    child: Text(
                      selecteStr,
                      style: TextStyle(
                          fontFamily: 'PingFangSC-Regular',
                          fontSize: 14,
                          color: index == selectedIdx
                              ? Color(0xFF4C87F1)
                              : Color(0xFF333333)),
                    ),
                    onPressed: () {
                      onTap(selecteStrs.indexOf(selecteStr));
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.transparent), // 不要点击效果
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(12)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  );
                }),
            Container(
              height: MediaQuery.of(context).padding.bottom,
              color: Color(0xFFFFFFFF),
            ),
          ]),
    );
  }
}
