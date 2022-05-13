import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectCategorySheet extends StatefulWidget {
  List<String> leftStrs = ["热门需求", '创意设计', '开发/游戏', '营销/文案', '工程/ 装修', '其他'];
  List<Map<String, List<String>>> leftDicts = [
    {
      "热门需求": ["热门需求1", "热门需求2"]
    },
    {
      "创意设计": ["LOGO设计", "VI系统设计", "包装设计", "PPT设计"]
    },
    {
      "开发/游戏": ["APP定制开发", "开发/游戏2"]
    },
    {
      "营销/文案": ["营销/文案1", "营销/文案2"]
    },
    {
      "工程/装修": ["工程/装修1", "工程/装修2"]
    },
    {
      "其他": ["其他1", "其他2"]
    },
  ];
  int leftSelectedIdx = 0;
  SelectCategorySheet({Key? key}) : super(key: key);

  @override
  State<SelectCategorySheet> createState() => _SelectCategorySheetState();
}

class _SelectCategorySheetState extends State<SelectCategorySheet> {
  @override
  Widget build(BuildContext context) {
    var leftTable = Container(
      color: Color(0xffF7F7F7),
      width: 80,
      child: ListView.builder(
        itemCount: widget.leftStrs.length,
        itemBuilder: (context, index) {
          return InkWell(
              highlightColor: Colors.transparent, // InkWell不要点击效果
              splashColor: Colors.transparent, // InkWell不要点击效果
              onTap: () {
                setState(() {
                  widget.leftSelectedIdx = index;
                });
              },
              child: Container(
                height: 46,
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      color: widget.leftSelectedIdx == index
                          ? Color(0xFF4C87F1)
                          : Color(0xFFF7F7F7),
                    ),
                    Expanded(
                      child: Container(
                        color: widget.leftSelectedIdx == index
                            ? Colors.white
                            : Color(0xFFF7F7F7),
                        child: Center(
                          child: Text(
                            widget.leftStrs[index],
                            style: TextStyle(
                                fontFamily: 'PingFangSC-Regular',
                                fontSize: 12,
                                color: Color(0xFF666666)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
    var titleRow = Row(
      children: [
        SizedBox(
          width: 12,
        ),
        Text(
          '选择类目',
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
    );
    var sureBtnView = Row(
      children: [
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xFF79A2F2), Color(0xFF3071F2)])),
              child: TextButton(
                onPressed: () {
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
          ),
        )
      ],
    );
    var bottomSafeAerawHeightView = Container(
      height: MediaQuery.of(context).padding.bottom,
    );
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 12, 0),
        child: Column(
            mainAxisSize: MainAxisSize.min, //sheet高度自适应
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleRow,
              Container(
                height: 300,
                child: Row(children: [
                  leftTable,
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: ListView.builder(
                          itemCount: widget.leftDicts.length,
                          itemBuilder: (context, index) {
                            var rightTitleRow = Container(
                              height: 46,
                              child: Row(
                                children: [
                                  Text(
                                    '创意设计',
                                    style: TextStyle(
                                        fontFamily: 'PingFangSC-Regular',
                                        fontSize: 13,
                                        color: Color(0xFF999999)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Color(0xffF5F6FA),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            List<Container> texs = [];
                            widget.leftDicts[index].forEach((key, value) {
                              value.forEach((element) {
                                Container text = Container(
                                    alignment: Alignment.centerLeft,
                                    height: 46,
                                    child: Text(
                                      element,
                                      style: TextStyle(
                                          fontFamily: 'PingFangSC-Regular',
                                          fontSize: 14,
                                          color: Color(0xFF333333)),
                                    ));
                                texs.add(text);
                              });
                            });

                            return Column(
                              children: [
                                rightTitleRow,
                                ListView(
                                  physics:
                                      NeverScrollableScrollPhysics(), // 禁止滚动
                                  shrinkWrap: true,
                                  children: texs,
                                )
                              ],
                            );
                          }),
                    ),
                  )
                ]),
              ),
              sureBtnView,
              bottomSafeAerawHeightView,
            ]));
  }
}
