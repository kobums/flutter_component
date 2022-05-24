import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  LoginController();

  static const storage = FlutterSecureStorage();
  var isLogin = false.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginState();
    });
  }

  loginState() async {
    String? userInfo = await storage.read(key: 'login');
    if (userInfo != null) {
      isLogin.value = true;
    }
  }

  logout() async {
    await storage.delete(key: 'login');
    await storage.delete(key: 'token');
    isLogin.value = false;
  }
}
