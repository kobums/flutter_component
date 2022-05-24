import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class AuthService extends GetMiddleware {
  final authController = Get.put(AuthController());

  @override
  RouteSettings? redirect(String? route) {
    return authController.authenticated || route == '/login'
        ? null
        : const RouteSettings(name: '/login');
  }
}
