import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/profile_photo_components.dart';

class EditProfileController extends GetxController {
  EditProfileController();
  final _name = ''.obs;
  final _id = ''.obs;
  final _website = ''.obs;
  final _about = ''.obs;

  String get name => _name.value;
  set name(value) => _name.value = value;
  String get id => _id.value;
  set id(value) => _id.value = value;
  String get website => _website.value;
  set website(value) => _website.value = value;
  String get about => _about.value;
  set about(value) => _about.value = value;

  final txtName = TextEditingController();
  final txtId = TextEditingController();
  final txtWebsite = TextEditingController();
  final txtAbout = TextEditingController();
}

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  EditProfileController c = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "프로필 수정",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        leading: TextButton(
          child: const Text(
            "취소",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "완료",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          ProfilePhoto(
            onClicked: () {
              print("aaa");
            },
          ),
          const SizedBox(height: 40),
          const SizedBox(
            child: Divider(thickness: 2.0),
          ),
          EditTextContainer(context, "이름"),
          const Padding(
            padding: EdgeInsets.fromLTRB(110.0, 0, 20.0, 0),
            child: SizedBox(
              child: Divider(thickness: 2.0),
            ),
          ),
          EditTextContainer(context, "사용자 이름"),
          const Padding(
            padding: EdgeInsets.fromLTRB(110.0, 0, 20.0, 0),
            child: SizedBox(
              child: Divider(thickness: 2.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "웹 사이트",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  controller: c.txtId,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                    hintText: "웹 사이트",
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.all(6),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(110.0, 0, 20.0, 0),
            child: SizedBox(
              child: Divider(thickness: 2.0),
            ),
          ),
          EditTextContainer(context, "소개"),
          const SizedBox(
            child: Divider(thickness: 2.0),
          ),
        ],
      ),
    );
  }

  Widget EditTextContainer(BuildContext context, String name) {
    return GestureDetector(
      onTap: () {
        print("asdfasd");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
