import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/router.dart';
import 'package:furniture_app/core/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  RouteGenerator routeGenerate = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture app',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.light,
      initialRoute: '/',
      onGenerateRoute: routeGenerate.routeGenerate,
    );
  }
}
