import 'package:flutter/material.dart';
import 'BlockType.dart';

/// 反馈时间要求
enum FeedbackTimeTequirementType {
  /// 不需要定期反馈
  RegularFeedbackIsNotRequired,

  /// 需要定期反馈
  NeedRegularFeedback,

  /// 无要求
  NoRequirement,
}

FeedbackTimeTequirementType FeedbackTimeTequirementTypeFromStr(String? str) {
  if (str == null) {
    return FeedbackTimeTequirementType.NoRequirement;
  }
  if (str == '不需要定期反馈') {
    return FeedbackTimeTequirementType.RegularFeedbackIsNotRequired;
  } else if (str == '需要定期反馈') {
    return FeedbackTimeTequirementType.NeedRegularFeedback;
  } else if (str == '无要求') {
    return FeedbackTimeTequirementType.NoRequirement;
  }
  return FeedbackTimeTequirementType.NoRequirement;
}

String strFromFeedbackTimeTequirementType(FeedbackTimeTequirementType? type) {
  if (type == null) {
    return '无要求';
  }
  switch (type) {
    case FeedbackTimeTequirementType.RegularFeedbackIsNotRequired:
      return '不需要定期反馈';
    case FeedbackTimeTequirementType.NeedRegularFeedback:
      return '需要定期反馈';
    case FeedbackTimeTequirementType.NoRequirement:
      return '无要求';
    default:
      return '无要求';
  }
}

// ignore: must_be_immutable
class FeedbackTimeRequirementSheet extends StatelessWidget {
  /// 选中哪一项
  FeedbackTimeTequirementType type;

  /// 回调外面，当前选择的哪个联系方式
  typeStringCallback onTap;

  FeedbackTimeRequirementSheet(
      {Key? key,
      this.type = FeedbackTimeTequirementType.NoRequirement,
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
                  '反馈时间要求',
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
                '不需要定期反馈',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 14,
                    color: type ==
                            FeedbackTimeTequirementType
                                .RegularFeedbackIsNotRequired
                        ? Color(0xFF4C87F1)
                        : Color(0xFF333333)),
              ),
              onPressed: () {
                onTap(strFromFeedbackTimeTequirementType(
                    FeedbackTimeTequirementType.RegularFeedbackIsNotRequired));
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
                  onTap(strFromFeedbackTimeTequirementType(
                      FeedbackTimeTequirementType.NeedRegularFeedback));
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
                  '需要定期反馈',
                  style: TextStyle(
                      fontFamily: 'PingFangSC-Regular',
                      fontSize: 14,
                      color: type ==
                              FeedbackTimeTequirementType.NeedRegularFeedback
                          ? Color(0xFF4C87F1)
                          : Color(0xFF333333)),
                )),
            TextButton(
                onPressed: () {
                  onTap(strFromFeedbackTimeTequirementType(
                      FeedbackTimeTequirementType.NoRequirement));
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
                      color: type == FeedbackTimeTequirementType.NoRequirement
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
