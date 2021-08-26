import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/route/route.dart';

void main() {
  runApp(startApp());
}

Widget startApp() {
  return MaterialApp(
    title: '瑞幸咖啡',
    onGenerateRoute: onGenerateRoute,
  );
}
