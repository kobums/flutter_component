import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart' as config;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  LoginController();

  static const storage = FlutterSecureStorage();
  var screenIndex = 0.obs;
  var isLogin = false.obs;
  var token = ''.obs;

  setScreen(pos) => screenIndex.value = pos;

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

  login(loginid, passwd) async {
    var result = await http.get(
      Uri.parse('${config.serverUrl}/api/jwt?loginid=$loginid&passwd=$passwd'),
    );
    if (result.statusCode == 200) {
      final parsed = json.decode(result.body);
      if (parsed['code'] == 'ok') {
        await storage.write(key: 'token', value: 'bearer ${parsed['token']}');
        await storage.write(key: 'login', value: 'id');
        isLogin.value = true;
      } else {}
    }
  }

  logout() async {
    await storage.delete(key: 'login');
    await storage.delete(key: 'token');
    isLogin.value = false;
  }
}
