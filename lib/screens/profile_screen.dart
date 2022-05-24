import 'package:flutter/material.dart';
import 'package:flutter_component/controller/auth_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController());

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
              controller.authenticated = false;
              Get.offAllNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}
