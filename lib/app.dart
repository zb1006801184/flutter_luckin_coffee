import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

Widget _bottomBarItem(String icon) {
  if (icon.contains('svg')) {
    return Container();
  }
  return Image.asset(
    icon,
    width: 20,
    height: 27,
    fit: BoxFit.cover,
  );
}

class _AppState extends State<App> {
  int curIndex = 0;
  final List<Widget> pageList = [];
  final List<BottomNavigationBarItem> tabbarList = [
    BottomNavigationBarItem(
      icon: _bottomBarItem('assets/images/tabbar/tabbar_home.png'),
      activeIcon: _bottomBarItem("assets/images/tabbar/tabbar_home_select.png"),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: _bottomBarItem('assets/images/tabbar/tabbar_home.png'),
      activeIcon: _bottomBarItem("assets/images/tabbar/tabbar_home_select.png"),
      label: '首页',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: tabbarList,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {},
      ),
      body: IndexedStack(
        index: curIndex,
        children: pageList,
      ),
    );
  }
}
