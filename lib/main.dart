import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  RouteGenerator routeGenerate = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: routeGenerate.routeGenerate,
    );
  }
}
