import 'package:flutter/material.dart';
import 'package:flutter_component/screens/infinity_screen.dart';
import 'package:get/get.dart';

import 'home.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
            name: "/", page: () => const Home(), transition: Transition.fade),
        GetPage(
            name: "/infinity",
            page: () => const InfinityScreen(),
            transition: Transition.downToUp),
      ],
    );
  }
}
