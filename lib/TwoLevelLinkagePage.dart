import 'package:flutter/material.dart';
import 'package:myflutter/TokenInfo.dart';
import 'NetUtil.dart';
import 'package:myflutter/UserInfo.dart';

class TwoLevelLinkagePage extends StatefulWidget {
  const TwoLevelLinkagePage({Key? key}) : super(key: key);

  @override
  State<TwoLevelLinkagePage> createState() => _TwoLevelLinkagePageState();
}

class _TwoLevelLinkagePageState extends State<TwoLevelLinkagePage> {
  String? name = '';
  void getUserInfo() async {
    await NetUtil(context).login('15198074391', 'aa123456');
    UserInfo userObj = await NetUtil(context).getUserInfo();
    setState(() {
      name = userObj.data?.departmentName;
    });
  }

  @override
  void initState() {
    super.initState();

    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
          'sfajsdfjsaldfjalsfdjlas\nsafas\n\nsajfos\n0482305803458080  ${name!}'),
    );
  }
}
