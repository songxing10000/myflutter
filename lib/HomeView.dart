import 'package:flutter/material.dart';
import 'package:myflutter/MyAppBar.dart';
import 'package:myflutter/main.dart';

class HomeView extends StatefulWidget {
  final String title2;
  const HomeView({Key? key, required this.title2}) : super(key: key);

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(hideBackIcon: true, context: context, titleStr: "首页"),
        body: ListView(children: [
          TextButton(
            child: Text('设计需求'),
            onPressed: () {
              Navigator.of(context).pushNamed('/TabTest');
            },
          ),
          TextButton(
            child: Text('需求详情'),
            onPressed: () {
              Navigator.of(context).pushNamed('/detail');
            },
          ),
          TextButton(
            child: Text('取消需求'),
            onPressed: () {
              Navigator.of(context).pushNamed('/canCelDemand');
            },
          ),
          TextButton(
            child: Text('发布需求4'),
            onPressed: () {
              Navigator.of(context).pushNamed('/ReleaseRequirement1Page');
            },
          )
        ]));
  }
}
