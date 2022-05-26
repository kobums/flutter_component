import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;
}

class RowScrollComponents extends StatelessWidget {
  RowScrollComponents({Key? key, required this.contents, required this.onPress})
      : super(key: key);

  List contents;
  Function onPress;

  final CategoryController c = Get.put(CategoryController());

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        c.selectedIndex = index;
        onPress(index);
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
                  contents[index],
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      height: 30.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: contents.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }
}
