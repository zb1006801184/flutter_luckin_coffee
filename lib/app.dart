import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/home/home.dart';
import 'package:flutter_luckin_coffee/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

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
  HomeViewModel _viewModel = HomeViewModel();

  final List<Widget> pageList = [
    Home(),
    Home(),
  ];
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

  Widget _bodyWidget() {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: tabbarList,
        type: BottomNavigationBarType.fixed,
        currentIndex: _viewModel.curIndex,
        selectedItemColor: Color(0xFF2b4c7e),
        unselectedItemColor: Color(0xFF2b4c7e),
        onTap: (int index) {
          _viewModel.tapTabbar(index);
        },
      ),
      body: IndexedStack(
        index: _viewModel.curIndex,
        children: pageList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _viewModel),
      ],
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return _bodyWidget();
        },
      ),
    );
  }
}
