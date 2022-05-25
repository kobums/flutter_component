import 'package:flutter/material.dart';
import 'package:flutter_component/controller/auth_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController());

  void showAertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('설정'),
          content: const Text("정말로 로그아웃하시겠습니까?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                controller.authenticated = false;
                Get.offAllNamed("/login");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Home',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextButton(
            child: const Text("logout"),
            onPressed: () {
              // controller.authenticated = false;
              // Get.offAllNamed("/login");
              showAertDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
