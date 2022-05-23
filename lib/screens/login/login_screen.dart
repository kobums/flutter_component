import 'package:flutter/material.dart';
import 'package:flutter_component/controller/login_controller.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    String loginid = '';
    String passwd = '';
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
            TextField(
              onChanged: (value) {
                loginid = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter your loginid"),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                passwd = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password"),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              '아이디를 확인해 주세요.',
              style: TextStyle(color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    controller.login(loginid, passwd);
                    if (controller.isLogin.value == true) {
                      Get.offAllNamed("/home");
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text('Login In',
                      style: TextStyle(color: Color.fromARGB(255, 30, 30, 30))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
