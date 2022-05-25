import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: 'imageHero',
        child: Image.network('https://picsum.photos/250?image=9'),
      ),
      onTap: () {
        Get.to(const DetailScreen());
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: 'imageHero',
        child: Image.network('https://picsum.photos/250?image=9'),
      ),
      onTap: () {
        Get.back();
      },
    );
  }
}
