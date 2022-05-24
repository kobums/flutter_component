import 'package:get/get.dart';

class MainController extends GetxController {
  var screenIndex = 0.obs;

  setScreen(pos) => screenIndex.value = pos;
}
