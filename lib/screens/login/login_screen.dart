import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_component/controller/auth_controller.dart';
import 'package:flutter_component/controller/login_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../components/textfield.dart';
import '../../config/config.dart' as config;
import '../../constants/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final LoginController controller = Get.put(LoginController());

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    void login(loginid, passwd) async {
      var result = await http.get(
        Uri.parse(
            '${config.serverUrl}/api/jwt?loginid=$loginid&passwd=$passwd'),
      );
      if (result.statusCode == 200) {
        final parsed = json.decode(result.body);
        if (parsed['code'] == 'ok') {
          authController.authenticated = true;
          await storage.write(key: 'token', value: 'bearer ${parsed['token']}');
          await storage.write(key: 'login', value: 'id');
          await Get.offAllNamed("/main");
        }
      } else {}
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 48.0,
            ),
            MyTextField(
                controller: controller.txtLoginid,
                decoration: kTextFieldDecoration,
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email)),
            const SizedBox(
              height: 8.0,
            ),
            MyTextField(
              controller: controller.txtPasswd,
              decoration: kTextFieldDecoration,
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock),
              obscureText: true,
            ),
            const SizedBox(
              height: 24.0,
            ),
            // const Text(
            //   '아이디를 확인해 주세요.',
            //   style: TextStyle(color: Colors.red),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    login(
                        controller.txtLoginid.text, controller.txtPasswd.text);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text('Login In',
                      style: TextStyle(color: Color.fromARGB(108, 30, 30, 30))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
