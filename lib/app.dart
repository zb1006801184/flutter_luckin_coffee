import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/home/home_page.dart';
import 'package:flutter_luckin_coffee/pages/menu/menu_page.dart';
import 'package:flutter_luckin_coffee/pages/mine/mine_page.dart';
import 'package:flutter_luckin_coffee/pages/order/order_page.dart';
import 'package:flutter_luckin_coffee/pages/shoping/shoping_page.dart';
import 'package:flutter_luckin_coffee/view_model/home_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

Widget _bottomBarItem(String icon) {
  if (icon.contains('svg')) {
    return SvgPicture.asset(icon, width: 20, height: 27);
  }
  return Image.asset(icon, width: 20, height: 27, fit: BoxFit.cover);
}

class _AppState extends State<App> {
  HomeViewModel _viewModel = HomeViewModel();
  final List<Widget> pageList = [HomePage(), MenuPage(), OrderPage(), ShoppingPage(), MinePage()];
  final List<BottomNavigationBarItem> tabbarList = [
    BottomNavigationBarItem(
      icon: _bottomBarItem('assets/images/tabbar/tabbar_home.png'),
      activeIcon: _bottomBarItem("assets/images/tabbar/tabbar_home_select.png"),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: _bottomBarItem('assets/images/tabbar/tabbar_menu.svg'),
      activeIcon: _bottomBarItem("assets/images/tabbar/tabbar_menu_select.svg"),
      label: '菜单',
    ),
    BottomNavigationBarItem(
      icon: _bottomBarItem('assets/images/tabbar/tabbar_order.svg'),
      activeIcon: _bottomBarItem("assets/images/tabbar/tabbar_order_select.svg"),
      label: '订单',
    ),
    BottomNavigationBarItem(
      icon: _bottomBarItem('assets/images/tabbar/tabbar_shopping_cart.svg'),
      activeIcon: _bottomBarItem("assets/images/tabbar/tabbar_shopping_cart_select.svg"),
      label: '购物车',
    ),
    BottomNavigationBarItem(
      icon: _bottomBarItem('assets/images/tabbar/tabbar_mine.svg'),
      activeIcon: _bottomBarItem("assets/images/tabbar/tabbar_mine_select.svg"),
      label: '我的',
    ),
  ];

  Widget _bodyWidget() {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: tabbarList,
        type: BottomNavigationBarType.fixed,
        currentIndex: _viewModel.curIndex,
        selectedItemColor: Color(0xFF2b4c7e),
        unselectedItemColor: Color(0xFF2b4c7e),
        onTap: (int index) => _viewModel.tapTabbar(index),
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
      providers: [ChangeNotifierProvider(create: (_) => _viewModel)],
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return _bodyWidget();
        },
      ),
    );
  }
}
