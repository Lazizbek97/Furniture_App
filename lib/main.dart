import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:furniture_app/core/hive/hive_initialize.dart';
import 'package:furniture_app/core/utils/router.dart';
import 'package:furniture_app/core/utils/theme.dart';
import 'package:furniture_app/screens/providers/auth_provider/auth_provider.dart';
import 'package:furniture_app/screens/providers/cart_provider/cart_provider.dart';
import 'package:furniture_app/screens/providers/furniture_provider/furniture_provider.dart';
import 'package:furniture_app/screens/providers/home_page_provider/homepage_provider.dart';
import 'package:furniture_app/screens/providers/isfavorite_provider/is_favorite_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    FurnitureProvider().loadData();
    // Hive.deleteBoxFromDisk("mebel");
    // Hive.deleteBoxFromDisk("favorites");
  }

  // @override
  // void dispose() {
  //   Hive.close();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<AuthProvider>().authChanges,
            initialData: 0)
      ],
      child: MaterialApp(
        title: 'Furniture app',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.light,
        initialRoute: '/',
        onGenerateRoute: routeGenerate.routeGenerate,
      ),
    );
  }
}
