import 'package:flutter/material.dart';
import 'package:flutter_component/controller/auth_controller.dart';
import 'package:flutter_component/screens/edit_profile_screen.dart';
import 'package:get/get.dart';

import '../components/profile_photo_components.dart';

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

  void showModalBottom(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                          ),
                        ),
                        child: const Text('프로필 사진 변경'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10)),
                          ),
                        ),
                        child: const Text('프로필 사진 변경'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Text('Done!'),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ProfilePhoto(
          onClicked: () {
            showModalBottom(context);
          },
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          children: const [
            Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              "name@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.to(EditProfileScreen(), transition: Transition.downToUp);
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              onPrimary: Colors.white,
            ),
            child: const Text('프로필 변경'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BuildButton(context, '1500', 'Picture'),
            BuildDivider(),
            BuildButton(context, '135', 'Following'),
            BuildDivider(),
            BuildButton(context, '150', 'Followers'),
          ],
        ),
        const SizedBox(height: 48),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'About',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Perhaps the feelings that we experience when we are in love represent a normal state. Being in love shows a person who he should be. Perhaps the feelings that we experience when we are in love represent a normal state. Being in love shows a person who he should be.",
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget BuildDivider() {
    return const SizedBox(
      height: 24,
      child: VerticalDivider(),
    );
  }
}

Widget BuildButton(BuildContext context, String num, String text) {
  return MaterialButton(
    padding: const EdgeInsets.symmetric(vertical: 4),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    onPressed: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          num,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 2),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Home',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//           TextButton(
//             child: const Text("logout"),
//             onPressed: () {
//               showAertDialog(context);
//             },
//           ),
//         ],
//       ),
