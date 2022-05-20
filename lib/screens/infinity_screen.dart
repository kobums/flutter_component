import 'package:flutter/material.dart';
import 'package:flutter_component/components/infinity_components.dart';
import 'package:get/get.dart';

class InfinityScreen extends StatelessWidget {
  const InfinityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinity Screen'),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () => Get.toNamed("/artauction"),
              child: const Text("hi"))
        ],
      ),
      body: InfinityComponents(
        url: 'http://artauction.netb.co.kr/api/picture',
        tag: 'infinity',
      ),
    );
  }
}
