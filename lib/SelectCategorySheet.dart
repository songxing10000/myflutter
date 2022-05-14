import 'package:flutter/material.dart';
import 'linkage_view.dart';

class SelectCategorySheet extends StatefulWidget {
  SelectCategorySheet({Key? key}) : super(key: key);

  @override
  State<SelectCategorySheet> createState() => _SelectCategorySheetState();
}

class _SelectCategorySheetState extends State<SelectCategorySheet> {
  late List<BaseItem> myitems;
  void initState() {
    super.initState();

    myitems = [
      BaseItem(isHeader: true, header: "热门需求"),
      BaseItem(isHeader: false, title: "热门需求1"),
      BaseItem(isHeader: false, title: "热门需求2"),
      BaseItem(isHeader: true, header: "创意设计"),
      BaseItem(isHeader: false, title: "LOGO设计"),
      BaseItem(isHeader: false, title: "VI系统设计"),
      BaseItem(isHeader: false, title: "包装设计"),
      BaseItem(isHeader: false, title: "PPT设计"),
      BaseItem(isHeader: true, header: "开发/游戏"),
      BaseItem(isHeader: false, title: "APP定制开发"),
      BaseItem(isHeader: false, title: "开发/游戏2"),
      BaseItem(isHeader: true, header: "营销/文案"),
      BaseItem(isHeader: false, title: "营销/文案1"),
      BaseItem(isHeader: false, title: "营销/文案2"),
      BaseItem(isHeader: true, header: "工程/装修"),
      BaseItem(isHeader: false, title: "工程/装修1"),
      BaseItem(isHeader: false, title: "工程/装修2"),
      BaseItem(isHeader: true, header: "其他"),
      BaseItem(isHeader: false, title: "其他1"),
      BaseItem(isHeader: false, title: "其他2"),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
              LinkageView(
                items: myitems,
                duration: 500,
                isNeedStick: true,
                itemHeadHeight: 46,
                itemHeight: 46,
                itemBuilder: (content, index, item) {
                  if (item.isHeader) {
                    return Container(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(width: 12),
                              Text(item.header!,
                                  style: TextStyle(
                                      fontFamily: 'PingFangSC-Regular',
                                      fontSize: 13,
                                      color: Color(0xFF999999))),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFF5F6FA),
                                ),
                              )
                            ],
                          )),
                    );
                  } else {
                    return Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Row(children: [
                          SizedBox(width: 10),
                          Text(item.title!,
                              style: TextStyle(
                                  fontFamily: 'PingFangSC-Regular',
                                  fontSize: 14,
                                  color: Color(0xFF333333)))
                        ]));
                  }
                },
                groupItemBuilder: (content, index, item) {
                  return Container(
                      height: 46,
                      color: item.isSelect ? Colors.white : Color(0xffF7F7F7),
                      child: Row(
                        children: [
                          Container(
                              width: 4,
                              color: item.isSelect
                                  ? Color(0xFF4C87F1)
                                  : Color(0xffF7F7F7)),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              item.header!,
                              style: TextStyle(
                                  fontFamily: item.isSelect
                                      ? 'PingFangSC-Medium'
                                      : 'PingFangSC-Regular',
                                  fontSize: 12,
                                  color: item.isSelect
                                      ? Color(0xFF4C87F1)
                                      : Color(0xFF666666)),
                            ),
                          )),
                        ],
                      ));
                },
                onGroupItemTap: (content, index, item) {
                  print("tab is ${item.header} click");
                },
                headerBuilder: (content, item) {
                  return Container(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(width: 12),
                            Text(item.header!,
                                style: TextStyle(
                                    fontFamily: 'PingFangSC-Regular',
                                    fontSize: 13,
                                    color: Color(0xFF999999))),
                            SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Color(0xFFF5F6FA),
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
              sureBtnView,
              bottomSafeAerawHeightView,
            ]));
  }
}
