import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furniture_app/screens/presentations/borading/boarding.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Boarding());
    }
    return null;
  }
}
