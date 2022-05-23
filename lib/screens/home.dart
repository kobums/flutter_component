import 'package:flutter/material.dart';
import 'package:flutter_component/controller/login_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () => Get.toNamed("/infinity"),
              child: const Text("infinity"),
            ),
            TextButton(
              onPressed: () => Get.toNamed("/artauction"),
              child: const Text("artauction"),
            ),
            TextButton(
              child: const Text("logout"),
              onPressed: () => controller.logout(),
            ),
            TextButton(
              child: const Text("login page"),
              onPressed: () => Get.toNamed("/login"),
            )
          ],
        ),
      ),
    );
  }
}
