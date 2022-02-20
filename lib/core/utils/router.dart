import 'package:flutter/material.dart';
import 'package:furniture_app/screens/presentations/about_page.dart/about_page.dart';
import 'package:furniture_app/screens/presentations/borading/boarding.dart';
import 'package:furniture_app/screens/presentations/cart_page/cart_page.dart';
import 'package:furniture_app/screens/presentations/checkout_page/checkout_page.dart';
import 'package:furniture_app/screens/presentations/completed_payment/payment_completed.dart';
import 'package:furniture_app/screens/presentations/favorites_page/favorites.dart';
import 'package:furniture_app/screens/presentations/home_page/home_page.dart';
import 'package:furniture_app/screens/presentations/rating_reviews/rating_reviews.dart';

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
      case '/home_page':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/about_page':
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case '/cart_page':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/checkout_page':
        return MaterialPageRoute(builder: (_) => const CheckOutPage());
      case '/payment_completed':
        return MaterialPageRoute(builder: (_) => const PaymentCompleted());
      case '/review_ratings':
        return MaterialPageRoute(builder: (_) => const RatingReviews());
      case '/favorites_page':
        return MaterialPageRoute(builder: (_) => const FavoritesPage());
    }
    return null;
  }
}
// 