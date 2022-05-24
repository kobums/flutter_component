import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_component/controller/login_controller.dart';
import 'package:flutter_component/screens/infinityScroll/user_screen.dart';
import 'package:flutter_component/screens/infinityScroll/picture_screen.dart';
import 'package:get/get.dart';

List<Widget> screenList = [
  const UserScreen(),
  const PictureScreen(),
];

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Widget getActionButton(context, c) {
    log(c.screenIndex.value.toString());
    if (c.screenIndex.value == 1) {
      return FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
          onPressed: () => null);
    } else {
      return Container();
    }
  }

  clickBottom(c, value) {
    c.setScreen(value);
  }

  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());

    return Scaffold(
        appBar: AppBar(title: const Text('main')),
        body: Obx(
          () => screenList[c.screenIndex.value],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: c.screenIndex.value,
              fixedColor: Theme.of(context).primaryColor,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.square_favorites),
                    label: 'trade'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cube), label: 'game'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chat_bubble), label: 'chat'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person_circle), label: 'my')
              ],
              onTap: (value) {
                clickBottom(c, value);
              },
            )),
        floatingActionButton: Obx(() => getActionButton(context, c)));
  }
}
