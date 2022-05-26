import 'package:flutter/material.dart';
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
    UserScreen(),
    const PictureScreen(),
    const HeroScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];
  final CategoryController c = Get.put(CategoryController());

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          height: 30.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategory(index),
          ),
        ),
        SizedBox(
          height: 500.0,
          child: Obx(() => screenList[c.selectedIndex]),
        )
      ],
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        c.selectedIndex = index;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(
              () => Container(
                padding: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2.0,
                      color: c.selectedIndex == index
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: c.selectedIndex == index ? Colors.red : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryController extends GetxController {
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  selectedTextColor(index) {
    return selectedIndex == index ? Colors.red : Colors.black;
  }
}
