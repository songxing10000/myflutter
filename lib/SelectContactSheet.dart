import 'package:flutter/material.dart';
import 'BlockType.dart';

/// 联系方式
enum ContactInfoType {
  /// 隐私电话
  PrivatePhone,

  /// 企业微信
  EnterpriseWechat,

  /// 不限联系方式
  Unlimited,
}

ContactInfoType ContactInfoTypeFromStr(String? str) {
  if (str == null) {
    return ContactInfoType.Unlimited;
  }
  if (str == '隐私电话') {
    return ContactInfoType.PrivatePhone;
  } else if (str == '企业微信') {
    return ContactInfoType.EnterpriseWechat;
  } else if (str == '不限联系方式') {
    return ContactInfoType.Unlimited;
  }
  return ContactInfoType.Unlimited;
}

String strFromContactInfoType(ContactInfoType? type) {
  if (type == null) {
    return '不限联系方式';
  }
  switch (type) {
    case ContactInfoType.PrivatePhone:
      return '隐私电话';
    case ContactInfoType.EnterpriseWechat:
      return '企业微信';
    case ContactInfoType.Unlimited:
      return '不限联系方式';
    default:
      return '不限联系方式';
  }
}

// ignore: must_be_immutable
class SelectContactSheet extends StatelessWidget {
  /// 选中哪一项
  ContactInfoType type = ContactInfoType.Unlimited;

  /// 回调外面，当前选择的哪个联系方式
  typeStringCallback onTap;

  SelectContactSheet(
      {Key? key, this.type = ContactInfoType.Unlimited, required this.onTap})
      : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
      child: Column(mainAxisSize: MainAxisSize.min, //sheet高度自适应
          children: [
            Row(
              children: [
                Text(
                  '联系方式',
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
            TextButton(
              child: Text(
                '隐私电话',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 14,
                    color: type == ContactInfoType.PrivatePhone
                        ? Color(0xFF4C87F1)
                        : Color(0xFF333333)),
              ),
              onPressed: () {
                print("object");
                onTap(strFromContactInfoType(ContactInfoType.PrivatePhone));
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.transparent), // 不要点击效果
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            TextButton(
                onPressed: () {
                  onTap(
                      strFromContactInfoType(ContactInfoType.EnterpriseWechat));
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.transparent), // 不要点击效果
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '企业微信',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 14,
                      color: type == ContactInfoType.EnterpriseWechat
                          ? Color(0xFF4C87F1)
                          : Color(0xFF333333)),
                )),
            TextButton(
                onPressed: () {
                  onTap(strFromContactInfoType(ContactInfoType.Unlimited));
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.transparent), // 不要点击效果
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '不限联系方式',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 14,
                      color: type == ContactInfoType.Unlimited
                          ? Color(0xFF4C87F1)
                          : Color(0xFF333333)),
                )),
            Container(
              height: MediaQuery.of(context).padding.bottom,
              color: Color(0xFFFFFFFF),
            ),
          ]),
    );
  }
}
