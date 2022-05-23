import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imageLogoName = 'assets/images/public/splash.png';

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final LoginController controller = Get.put(LoginController());

    Timer(const Duration(milliseconds: 1500), () {
      if (controller.isLogin.value == true) {
        Get.offAllNamed("/mainscreen");
      } else {
        Get.offAllNamed("/login");
      }
    });

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image.asset(
              imageLogoName,
              width: screenWidth * 0.916666,
              height: screenHeight * 0.1859375,
            ),
          ),
        ),
      ),
    );
  }
}
