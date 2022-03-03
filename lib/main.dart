import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:furniture_app/core/hive/hive_initialize.dart';
import 'package:furniture_app/core/services/payment_service/payment_service.dart';
import 'package:furniture_app/core/services/shipping_address_service/shipping_address_service.dart';
import 'package:furniture_app/core/utils/router.dart';
import 'package:furniture_app/core/utils/theme.dart';
import 'package:furniture_app/screens/presentations/no_internet_connection_page/no_internet_con_page.dart';
import 'package:furniture_app/screens/providers/auth_provider/auth_provider.dart';
import 'package:furniture_app/screens/providers/cart_provider/cart_provider.dart';
import 'package:furniture_app/screens/providers/change_profile_pic/change_profile_pic.dart';
import 'package:furniture_app/screens/providers/checkout_provider/checkout_provider.dart';
import 'package:furniture_app/screens/providers/color_picker_provider/color_picker_provider.dart';
import 'package:furniture_app/screens/providers/furniture_provider/furniture_provider.dart';
import 'package:furniture_app/screens/providers/home_page_provider/homepage_provider.dart';
import 'package:furniture_app/screens/providers/isfavorite_provider/is_favorite_provider.dart';
import 'package:furniture_app/screens/providers/notifications_provider/notification_provider.dart';
import 'package:furniture_app/screens/providers/payment_provider/payment_provider.dart';
import 'package:furniture_app/screens/providers/shipping_address_provider/shipping_adress_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'core/models/furniture_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveInitialize.initHive();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RouteGenerator routeGenerate = RouteGenerator();
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;
  static late StreamSubscription subscription;

  @override
  void initState() {
    FurnitureProvider().loadData();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        this.result = result;
        print("result: ${result.name}");
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return result.name != 'none'
        ? MultiProvider(
            providers: [
              FutureProvider<Box<FurnitureModel>>(
                create: (context) => FurnitureProvider().loadData(),
                initialData: Boxes.getMebel(),
                catchError: (context, v) {
                  return Boxes.getMebel();
                },
              ),
              ChangeNotifierProvider(create: (_) => HomePageProvider()),
              ChangeNotifierProvider(create: (_) => IsFavoriteProvider()),
              ChangeNotifierProvider(create: (_) => CartProvider()),
              ChangeNotifierProvider(create: (_) => CheckOutProvider()),
              ChangeNotifierProvider(create: (_) => ShippingAddressProvider()),
              ChangeNotifierProvider(create: (_) => PaymentProvider()),
              ChangeNotifierProvider(create: (_) => NotificationProvider()),
              ChangeNotifierProvider(create: (_) => PaymentPageService()),
              ChangeNotifierProvider(create: (_) => ShippingPageService()),
              ChangeNotifierProvider(create: (_) => ChangeProfilePicture()),
              ChangeNotifierProvider(create: (_) => ColorPicker()),
              ChangeNotifierProvider<AuthProvider>(
                create: (_) => AuthProvider(FirebaseAuth.instance),
              ),
              StreamProvider(
                  create: (context) => context.read<AuthProvider>().authChanges,
                  initialData: 0),
            ],
            child: MaterialApp(
              title: 'Furniture app',
              debugShowCheckedModeBanner: false,
              theme: MainTheme.light,
              initialRoute: '/',
              onGenerateRoute: routeGenerate.routeGenerate,
            ),
          )
        : MaterialApp(
            title: 'Furniture app',
            debugShowCheckedModeBanner: false,
            theme: MainTheme.light,
            home: NoInternetConnectionPage(),
          );
  }
}
