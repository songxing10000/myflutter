import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef Widget GetHearWidget<M extends BaseItem>(BuildContext context, M item);
typedef Widget GetGeneralItem<M extends BaseItem>(
    BuildContext context, int index, M item);
typedef Widget GetGroupItem<M extends BaseItem>(
    BuildContext context, int index, M item);
typedef void OnGroupItemTap<M extends BaseItem>(
    BuildContext context, int index, M item);

class BaseItem {
  bool isHeader;
  String? header = '';
  bool isSelect = false;
  String? title = '';
  dynamic info = null;
  int index = 0;

  BaseItem({required this.isHeader, this.header, this.info, this.title});
}

class LinkageView extends StatefulWidget {
  final double itemHeadHeight;
  final double itemHeight;
  final double itemGroupHeight;

  final List<BaseItem> items;
  final GetGroupItem itemBuilder;
  final GetGeneralItem groupItemBuilder;
  final GetHearWidget headerBuilder;
  final OnGroupItemTap onGroupItemTap;
  final int duration;
  final bool isNeedStick;
  final Curve curve;
  final List<BaseItem> groups = [];

  LinkageView(
      {required this.items,
      required this.itemBuilder,
      required this.groupItemBuilder,
      required this.headerBuilder,
      required this.onGroupItemTap,
      this.isNeedStick = true,
      this.curve = Curves.linear,
      this.itemHeadHeight = 30,
      this.itemHeight = 50,
      this.itemGroupHeight = 50,
      required this.duration}) {
    for (var i = 0; i < items.length; i++) {
      items[i]
        ..index = i
        ..isSelect = false;
      if (items[i].isHeader) {
        groups.add(items[i]);
      }
    }
  }

  @override
  _LinkageViewState createState() => _LinkageViewState();
}

class _LinkageViewState extends State<LinkageView> {
  bool selected = false;
  int selectIndex = 0;
  bool showTopHeader = false;
  double headerOffset = 0.0;
  BaseItem? headerStr = null;
  double beforeScroll = 0.0;
  VoidCallback? callback;
  ScrollController? scrollController;
  ScrollController? groupScrollController;
  Size? containerSize;
  @override
  void initState() {
    super.initState();
    init();
  }

  void dispose() {
    super.dispose();
    if (callback != null) {
      scrollController?.removeListener(callback!);
    }
  }

  GlobalKey _containerKey = GlobalKey();
  _onBuildCompleted(Duration timestamp) {
    RenderObject? containerRenderBox =
        _containerKey.currentContext?.findRenderObject();
    if (containerRenderBox != null) {
      if (containerRenderBox is RenderBox) {
        containerSize = containerRenderBox.size;
      }
    }
  }

  Widget groupItem(BuildContext context, int index) {
    BaseItem item = widget.groups[index];
    return GestureDetector(
      onTap: () {
        print("$index tap");
        if (mounted) {
          setState(() {});
          widget.onGroupItemTap(context, index, widget.groups[index]);
          selectIndex = index;
          double tempLength = 0.0;
          for (var i = 0; i < widget.groups[index].index; i++) {
            double currentHeight = widget.items[i].isHeader
                ? widget.itemHeadHeight
                : widget.itemHeight;
            tempLength += currentHeight;
          }
          selected = true;
          scrollController
              ?.animateTo(tempLength,
                  duration: Duration(milliseconds: widget.duration),
                  curve: Curves.linear)
              .whenComplete(() {
            selected = false;
            print("异步任务处理完成");
          });
        }
      },
      child: Container(
        child: widget.groupItemBuilder(context, index, item),
        height: widget.itemGroupHeight,
      ),
    );
  }

  Widget generalItem(BuildContext context, int index) {
    BaseItem item = widget.items[index];
    if (item.isHeader) {
      return Container(
        child: widget.itemBuilder(context, index, item),
        height: widget.itemHeadHeight,
      );
    } else {
      return Container(
        child: widget.itemBuilder(context, index, item),
        height: widget.itemHeight,
      );
    }
  }

  //初始化控制器和分组
  init() {
    if (scrollController == null) {
      scrollController = ScrollController();
    }
    if (groupScrollController == null) {
      groupScrollController = ScrollController();
    }
    headerStr = widget.items.first;
    if (scrollController != null) {
      callback = () {
        double offset2 = scrollController?.offset ?? 0;
        if (offset2 >= 0) {
          if (mounted) {
            setState(() {
              showTopHeader = true;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              showTopHeader = false;
            });
          }
        }
        //计算滑动了多少距离了
        double pixels = scrollController?.position.pixels ?? 0;
        // print("pixels is $pixels");
        double tempLength = 0.0;
        int position = 0;
        double offset = 0;
        double currentHeight = 0.0;

        for (var i = 0; i < widget.items.length; i++) {
          currentHeight = widget.items[i].isHeader
              ? widget.itemHeadHeight
              : widget.itemHeight;
          tempLength += currentHeight;
          if (widget.items[i].isHeader) {
            headerStr!.isSelect = false;
            headerStr = widget.items[i];
            headerStr!.isSelect = true;
          }
          //滚动的大小没有超过最大的item index,那么当前地一个item的下标就是index
          if (tempLength >= pixels) {
            position = i;
            break;
          }
        }
        if (widget.items[position + 1].isHeader) {
          //如果下一个是header,又刚刚滚定到临界点,那么group往下一个
          if (tempLength == pixels) {
            headerStr!.isSelect = false;
            headerStr = widget.items[position + 1];
            headerStr!.isSelect = true;
          }
          if (mounted) {
            setState(() {
              offset = currentHeight - (tempLength - pixels);
              if (offset - (widget.itemHeight - widget.itemHeadHeight) >= 0) {
                headerOffset =
                    -(offset - (widget.itemHeight - widget.itemHeadHeight));
              }
            });
          }
        } else {
          if (headerOffset != 0) {
            if (mounted) {
              setState(() {
                headerOffset = 0.0;
              });
            }
          }
        }
        // if (!selected) {
        resetGroupPosition();
        // }
      };
      if (headerStr != null) {
        headerStr!.isSelect = true;
      }
      if (callback != null) {
        scrollController?.addListener(callback!);
      }
    }
  }

  resetGroupPosition() {
    if (containerSize != null) {
      int index = 0;
      if (!selected) {
        for (var i = 0; i < widget.groups.length; i++) {
          if (headerStr == widget.groups[i]) {
            index = i;
          }
        }
      } else {
        index = selectIndex;
      }

      double currentLength = widget.itemGroupHeight * (index + 1);
      double offset = 0;

      if (containerSize != null &&
          currentLength > containerSize!.height / 2 &&
          widget.groups.length * widget.itemGroupHeight >
              containerSize!.height) {
        offset = ((currentLength - containerSize!.height / 2) /
                widget.itemGroupHeight.round()) *
            widget.itemGroupHeight;
        if (containerSize != null &&
            offset + containerSize!.height >
                widget.groups.length * widget.itemGroupHeight) {
          offset = widget.groups.length * widget.itemGroupHeight -
              containerSize!.height;
        }
        groupScrollController?.animateTo(offset,
            duration: Duration(milliseconds: widget.duration),
            curve: Curves.linear);
      }

      // if ((currentLength - (widget.itemGroupHeight / 2)) >= containerSize.height / 2 &&
      //     widget.groups.length * widget.itemGroupHeight > containerSize.height) {
      //   // offset = (currentLength - (widget.itemGroupHeight / 2)) - containerSize.height / 2;
      //   if (offset + containerSize.height > widget.groups.length * widget.itemGroupHeight) {
      //     offset = widget.groups.length * widget.itemGroupHeight - containerSize.height;
      //   }

      //   groupScrollController.animateTo(offset, duration: Duration(milliseconds: widget.duration), curve: Curves.ease);
      // }
      if (containerSize != null &&
          currentLength <= containerSize!.height / 2 &&
          offset < widget.itemGroupHeight) {
        offset = 0;
        groupScrollController?.animateTo(offset,
            duration: Duration(milliseconds: widget.duration),
            curve: Curves.linear);
      }
      if (containerSize != null) {
        print(
            "currentLength is $currentLength offset is $offset   ${(currentLength - (widget.itemGroupHeight / 2))} ${containerSize!.height / 2}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_onBuildCompleted);

    return Container(
      height: 300,
      child: Row(
        children: <Widget>[
          Container(
              width: 86,
              child: ListView.builder(
                  key: _containerKey,
                  padding: EdgeInsets.all(0),
                  controller: groupScrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.groups.length,
                  itemBuilder: (BuildContext context, int index) {
                    return groupItem(context, index);
                  })),
          Expanded(
            child: Stack(children: [
              ListView.builder(
                padding: EdgeInsets.all(0),
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return generalItem(context, index);
                },
                // separatorBuilder: (context, index) {
                //   return Divider(
                //     height: .1,
                //     indent: 0,
                //     color: Color(0xFFDDDDDD),
                //   );
                // },
              ),
              Visibility(
                visible: widget.isNeedStick ? showTopHeader : false,
                child: Container(
                  height: widget.itemHeadHeight,
                  child: widget.headerBuilder(context, headerStr!),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
