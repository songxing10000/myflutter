import 'package:flutter/material.dart';
import 'BlockType.dart';

/// 开票要求
enum InvoicingRequirementType {
  /// 普通电子发票
  OrdinaryElectronicInvoice,

  /// 增值税专用发票
  VATSpecialInvoice,

  /// 无要求
  NoRequirement
}
InvoicingRequirementType InvoicingRequirementTypeFromStr(String? str) {
  if (str == null) {
    return InvoicingRequirementType.NoRequirement;
  }
  if (str == '普通电子发票') {
    return InvoicingRequirementType.OrdinaryElectronicInvoice;
  } else if (str == '增值税专用发票') {
    return InvoicingRequirementType.VATSpecialInvoice;
  } else if (str == '无要求') {
    return InvoicingRequirementType.NoRequirement;
  }
  return InvoicingRequirementType.NoRequirement;
}

String strFromInvoicingRequirementType(InvoicingRequirementType? type) {
  if (type == null) {
    return '无要求';
  }
  switch (type) {
    case InvoicingRequirementType.OrdinaryElectronicInvoice:
      return '普通电子发票';
    case InvoicingRequirementType.VATSpecialInvoice:
      return '增值税专用发票';
    case InvoicingRequirementType.NoRequirement:
      return '无要求';
    default:
      return '无要求';
  }
}

// ignore: must_be_immutable
class InvoicingRequirementSheet extends StatelessWidget {
  /// 选中哪一项
  InvoicingRequirementType type = InvoicingRequirementType.NoRequirement;

  /// 回调外面，当前选择的哪个联系方式
  typeStringCallback onTap;

  InvoicingRequirementSheet(
      {Key? key,
      this.type = InvoicingRequirementType.NoRequirement,
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
                  '开票要求',
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
                '普通电子发票',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 14,
                    color: type ==
                            InvoicingRequirementType.OrdinaryElectronicInvoice
                        ? Color(0xFF4C87F1)
                        : Color(0xFF333333)),
              ),
              onPressed: () {
                onTap(strFromInvoicingRequirementType(
                    InvoicingRequirementType.OrdinaryElectronicInvoice));
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
                  onTap(strFromInvoicingRequirementType(
                      InvoicingRequirementType.VATSpecialInvoice));
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
                  '增值税专用发票',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 14,
                      color: type == InvoicingRequirementType.VATSpecialInvoice
                          ? Color(0xFF4C87F1)
                          : Color(0xFF333333)),
                )),
            TextButton(
                onPressed: () {
                  onTap(strFromInvoicingRequirementType(
                      InvoicingRequirementType.NoRequirement));
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
                  '无要求',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 14,
                      color: type == InvoicingRequirementType.NoRequirement
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
