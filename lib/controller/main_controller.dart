import 'package:get/get.dart';

class MainController extends GetxController {
  final _screenIndex = 0.obs;

  int get screenIndex => _screenIndex.value;
  set screenIndex(value) => _screenIndex.value = value;

  setScreen(pos) {
    screenIndex = pos;
  }
}
