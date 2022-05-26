import 'package:flutter/material.dart';
import 'package:flutter_component/components/row_scroll_components.dart';
import 'package:flutter_component/controller/screen_controller.dart';
import 'package:flutter_component/screens/hero_screen.dart';
import 'package:flutter_component/screens/picture_screen.dart';
import 'package:flutter_component/screens/profile_screen.dart';
import 'package:flutter_component/screens/user_screen.dart';
import 'package:get/get.dart';

class RowScrollScreen extends StatelessWidget {
  RowScrollScreen({Key? key}) : super(key: key);

  List<String> categories = [
    "서머프리뷰",
    "추천",
    "랭킹",
    "업데이트",
    "코디",
    "세일",
    "스페셜",
    "메거진",
    "TV",
    "이벤트",
    "골프"
  ];

  List<Widget> screenList = [
    const UserScreen(),
    const PictureScreen(),
    const HeroScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  ScreenController c = Get.put(ScreenController());

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RowScrollComponents(
          contents: categories,
          onPress: (index) {
            c.screenIndex = index;
          },
        ),
        Obx(
          () => Expanded(
            child: screenList[c.screenIndex],
          ),
        )
      ],
    );
  }
}
