import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckCell extends StatelessWidget {
  String title;
  bool isSelected;
  double imgTitleMargin = 14;
  double imgLeftMargin = 0;
  GestureTapCallback? onTap = null;
  CheckCell({
    required this.title,
    required this.isSelected,
    this.imgLeftMargin = 0,
    this.imgTitleMargin = 14,
    this.onTap = null,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          SizedBox(
            width: imgLeftMargin,
          ),
          Image.asset(isSelected
              ? 'images/icon_xuanzhong.png'
              : 'images/icon_weixuanzhong.png'),
          SizedBox(
            width: imgTitleMargin,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'PingFangSC-Regular',
                fontSize: 14,
                color: Color(0xFF333333)),
          ),
        ],
      ),
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
    );
  }
}
