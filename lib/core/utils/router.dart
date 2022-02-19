import 'package:flutter/material.dart';
import 'package:furniture_app/screens/presentations/borading/boarding.dart';

import '../../screens/presentations/sign_in_page/sign_in_page.dart';
import '../../screens/presentations/sign_up_page/sing_up_page.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Boarding());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUpPage());
    }
    return null;
  }
}
// 