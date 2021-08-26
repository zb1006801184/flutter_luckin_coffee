import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  //banner
  Widget _bannerWidget() {
    return Container(height: 200, color: Colors.blueAccent);
  }

  //位置
  Widget _locationWidget() {
    return Container(height: 70, color: Colors.red);
  }

  Widget _cellContentWidget(int index) {
    return Container();
  }

  //尾部
  Widget _footWidget() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              _bannerWidget(),
              _locationWidget(),
              for (var i = 0; i < 4; i++) _cellContentWidget(i),
              _footWidget(),
            ],
          ),
        ));
  }
}
