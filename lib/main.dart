import 'package:flutter/material.dart';
import 'HomeView.dart';
import 'DetailView.dart';
import 'CancelDemandPage.dart';
import 'TabTest.dart';
import 'ReleaseRequirement2Page.dart';

import 'ReleaseRequirement3Page.dart';

import 'ReleaseRequirement4Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter2 Demo',
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder>{
          '/detail': (BuildContext context) => const DetailView(),
          '/canCelDemand': (BuildContext context) => const CancelDemandPage(),
          '/TabTest': (BuildContext context) => const TabTestView(),
          '/ReleaseRequirement2Page': (BuildContext context) =>
              ReleaseRequirement2Page(),
          '/ReleaseRequirement3Page': (BuildContext context) =>
              const ReleaseRequirement3Page(),
          '/ReleaseRequirement4Page': (BuildContext context) =>
              const ReleaseRequirement4Page(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _showBottomNav(),
      body: Center(
          child: IndexedStack(index: _selectedIndex, children: const [
        HomeView(
          title2: "f",
        ),
        HomeView(
          title2: "fff",
        ),
        HomeView(
          title2: "??",
        )
      ])),
    );
  }
}
