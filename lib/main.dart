import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/app.dart';
import 'package:flutter_luckin_coffee/route/route.dart';

void main() {
  runApp(startApp());
}

Widget startApp() {
  return MaterialApp(
    onGenerateRoute: onGenerateRoute,
  );
}
