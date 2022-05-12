import 'dart:math';

import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/DetailView.dart';
import 'MyAppBar.dart';
import 'common_tab.dart';
import 'dart:math';

/** 需求状态 */
enum DemandStatusType {
  /// 未开始
  NotStarted,

  /// 待确认
  ToBeConfirmed,

  /// 已确认
  Confirmed,

  /// 已取消
  Cancelled,
}
const Map<DemandStatusType, String> DemandStatusTypeStrInfo = {
  DemandStatusType.NotStarted: "未开始",
  DemandStatusType.ToBeConfirmed: "待确认",
  DemandStatusType.Confirmed: "已确认",
  DemandStatusType.Cancelled: "已取消",
};
const Map<DemandStatusType, Color> DemandStatusTypeColorInfo = {
  DemandStatusType.NotStarted: Color(0xFFEEC22B),
  DemandStatusType.ToBeConfirmed: Color(0xFFFD9344),
  DemandStatusType.Confirmed: Color(0xFF3071F2),
  DemandStatusType.Cancelled: Color(0xFFCCCCCC),
};

class TabTestView extends StatefulWidget {
  const TabTestView({Key? key}) : super(key: key);
  @override
  State<TabTestView> createState() => _TabTestViewState();
}

class _TabTestViewState extends State<TabTestView>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: "全部"),
    Tab(text: "未开始"),
    Tab(text: "待确认"),
    Tab(text: "已确认"),
    Tab(text: "已取消"),
  ];

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late TabController tabController;

    Widget list({DemandStatusType? type}) {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          DemandStatusType randomType = DemandStatusType
              .values[Random().nextInt(DemandStatusType.values.length)];
          return Container(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
              color: Color(0xffF7F7F7),
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            '我要LOGO设计',
                            style: TextStyle(
                                fontFamily: 'PingFangSC-Medium',
                                fontSize: 16,
                                color: Color(0xFF333333)),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: type != null
                                  ? DemandStatusTypeColorInfo[type]
                                  : DemandStatusTypeColorInfo[randomType]!,
                            ),
                            child: Text(
                              (type != null)
                                  ? DemandStatusTypeStrInfo[type]!
                                  : DemandStatusTypeStrInfo[randomType]!,
                              style: TextStyle(
                                  fontFamily: 'PingFangSC-Medium',
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: Text(
                            '请尽快完善需求',
                            style: TextStyle(
                                fontFamily: 'PingFangSC-Regular',
                                fontSize: 14,
                                color: Color(0xFF666666)),
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            '2022-03-28 16:22:43',
                            style: TextStyle(
                                fontFamily: 'PingFangSC-Regular',
                                fontSize: 12,
                                color: Color(0xFF666666)),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    '查看详情',
                                    style: TextStyle(
                                        fontFamily: 'PingFangSC-Regular',
                                        fontSize: 12,
                                        color: Color(0xFF3071F2)),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Image.asset('images/icchevronright.png'),
                                ],
                              ))
                        ],
                      )
                    ]),
              ));
        },
      );
    }

    return Scaffold(
        appBar: MyAppBar(context: context, titleStr: '设计需求'),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              height: 40,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(0xFFF7F7F7),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset('images/icon_sousuo.png'),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '请输入需求标题',
                    style: TextStyle(
                        fontFamily: 'PingFangSC-Regular',
                        fontSize: 12,
                        color: Color(0xFF999999)),
                  ),
                ]),
              ),
            ),
            Container(
              color: Colors.white,
              child: ICThemeTab(
                child: ExtendedTabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: myTabs,
                ),
              ),
            ),
            Expanded(
              child: ExtendedTabBarView(
                controller: _tabController,
                cacheExtent: 5,
                children: [
                  list(type: null),
                  list(type: DemandStatusType.NotStarted),
                  list(type: DemandStatusType.ToBeConfirmed),
                  list(type: DemandStatusType.Confirmed),
                  list(type: DemandStatusType.Cancelled),
                  // CourseIntegratedSearchView(),
                  // CourseSearchResultListView<BaseCourseSearchResultListController>(
                  //     categoryName: ""),
                  // PlanSearchResultListView(null),
                  // StudySearchResultListView(),
                  // LiveSearchResultListView(null)
                  // NewsSearchResultListView(),
                ],
              ),
            ),
          ],
        ));
  }
}
