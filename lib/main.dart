import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/app.dart';
import 'package:flutter_luckin_coffee/route/route.dart';

void main() {
  runApp(_app());
}

Widget _app() {
  return MaterialApp(
    onGenerateRoute: onGenerateRoute,
  );
}
