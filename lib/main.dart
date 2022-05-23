import 'package:flutter/material.dart';
import 'package:flutter_component/screens/login/login_screen.dart';
import 'package:flutter_component/screens/main_screen.dart';
import 'package:flutter_component/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'screens/home.dart';
import 'screens/infinityScroll/artauction_screen.dart';
import 'screens/infinityScroll/infinity_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/", page: () => Home(), transition: Transition.fade),
        GetPage(
            name: "/splash",
            page: () => const SplashScreen(),
            transition: Transition.fade),
        GetPage(
            name: "/login",
            page: () => const LoginScreen(),
            transition: Transition.fade),
        GetPage(
            name: "/infinity",
            page: () => const InfinityScreen(),
            transition: Transition.downToUp),
        GetPage(
            name: "/artauction",
            page: () => const ArtauctionScreen(),
            transition: Transition.downToUp),
        GetPage(
            name: "/mainscreen",
            page: () => const MainScreen(),
            transition: Transition.downToUp),
      ],
    );
  }
}
