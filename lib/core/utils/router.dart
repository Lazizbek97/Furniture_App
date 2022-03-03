import 'package:flutter/material.dart';
import 'package:furniture_app/screens/presentations/about_me_page/about_me_page.dart';
import 'package:furniture_app/screens/presentations/about_page.dart/about_page.dart';
import 'package:furniture_app/screens/presentations/add_payment_method/adding_payment_method.dart';
import 'package:furniture_app/screens/presentations/adding_shipment_address_page/adding_shipment.dart';
import 'package:furniture_app/screens/presentations/borading/boarding.dart';
import 'package:furniture_app/screens/presentations/cart_page/cart_page.dart';
import 'package:furniture_app/screens/presentations/checkout_page/checkout_page.dart';
import 'package:furniture_app/screens/presentations/completed_payment/payment_completed.dart';
import 'package:furniture_app/screens/presentations/favorites_page/favorites.dart';
import 'package:furniture_app/screens/presentations/home_page/home_page.dart';
import 'package:furniture_app/screens/presentations/my_orders_page/my_orders.dart';
import 'package:furniture_app/screens/presentations/my_reviews_page/my_reviews_page.dart';
import 'package:furniture_app/screens/presentations/payment_methods_page/payment_methods.dart';
import 'package:furniture_app/screens/presentations/rating_reviews/rating_reviews.dart';
import 'package:furniture_app/screens/presentations/settings_page/settings_page.dart';
import 'package:furniture_app/screens/presentations/shipping_address_page/shipping_address.dart';
import 'package:furniture_app/screens/providers/auth_provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../screens/presentations/sign_in_page/sign_in_page.dart';
import '../../screens/presentations/sign_up_page/sing_up_page.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          final fireBaseUser = context.watch<AuthProvider>();
          if (fireBaseUser.fireBaseAuth.currentUser != null) {
            return const HomePage();
          } else {
            return const Boarding();
          }
        });
      case '/signIn':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/home_page':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/about_page':
        return MaterialPageRoute(builder: (_) => AboutPage(index: args as int));
      case '/cart_page':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/checkout_page':
        return MaterialPageRoute(builder: (_) => const CheckOutPage());
      case '/payment_completed':
        return MaterialPageRoute(builder: (_) => const PaymentCompleted());
      case '/review_ratings':
        return MaterialPageRoute(
            builder: (_) => RatingReviews(
                  index: args as int,
                ));
      case '/favorites_page':
        return MaterialPageRoute(builder: (_) => const FavoritesPage());
      case '/myorders':
        return MaterialPageRoute(builder: (_) => const MyOrdersPage());
      case '/shipping_address':
        return MaterialPageRoute(builder: (_) => const ShippingAddressPage());
      case '/payment_methods':
        return MaterialPageRoute(builder: (_) => const PaymentMethods());
      case '/my_reviews':
        return MaterialPageRoute(builder: (_) => const MyReviewsPage());
      case '/adding_address':
        return MaterialPageRoute(builder: (_) => AddingShipmentAdressPage());
      case '/adding_payment_method':
        return MaterialPageRoute(builder: (_) => AddingPaymentMethodPage());
      case '/settings_page':
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case '/about_me':
        return MaterialPageRoute(builder: (_) =>  AboutMe());
    }
    return null;
  }
}
// 