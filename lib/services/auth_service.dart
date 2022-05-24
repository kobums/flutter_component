import 'package:flutter/material.dart';
import 'package:flutter_component/controller/login_controller.dart';
import 'package:get/get.dart';

class AuthService extends GetMiddleware {
  // final authController = Get.put(AuthController());
  final loginController = Get.put(LoginController());

  @override
  RouteSettings? redirect(String? route) {
    return loginController.isLogin.value || route == '/login'
        ? null
        : const RouteSettings(name: '/login');
  }
}
