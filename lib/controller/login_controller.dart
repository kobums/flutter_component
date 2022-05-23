import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart' as config;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  var screenIndex = 0.obs;
  var isLogin = false.obs;
  var token = ''.obs;

  var url = '${config.serverUrl}/api/jwt'.obs;

  static const storage = FlutterSecureStorage();

  LoginController();

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
      Uri.parse('${url.value}?loginid=$loginid&passwd=$passwd'),
    );
    print(result.statusCode);
    if (result.statusCode == 200) {
      final parsed = json.decode(result.body);
      await storage.write(
          key: 'token', value: 'bearer ${Login.fromJson(parsed).token}');
      await storage.write(key: 'login', value: 'id');
      isLogin.value = true;
    }
  }

  logout() async {
    await storage.delete(key: 'login');
    isLogin.value = false;
  }
}

class Login {
  final String token;

  const Login({required this.token});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(token: json['token'] as String);
  }
  Map<String, dynamic> toJson() => {'token': token};
}
