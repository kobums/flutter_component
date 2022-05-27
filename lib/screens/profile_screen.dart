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
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ProfilePhoto(
          onClicked: () {},
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
              print('프로필 변경');
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

class ProfilePhoto extends StatelessWidget {
  final VoidCallback onClicked;
  const ProfilePhoto({Key? key, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: const NetworkImage(
                  'https://images.unsplash.com/photo-1653256464939-d13e40b6089c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587',
                ),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: onClicked),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: ClipOval(
              child: Container(
                padding: const EdgeInsets.all(3),
                color: Colors.white,
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
