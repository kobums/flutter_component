import 'package:get/get.dart';

class AuthController extends GetxController {
  final _authenticated = false.obs;
  final _username = ''.obs;

  bool get authenticated => _authenticated.value;
  set authenticated(value) => _authenticated.value = value;
  String get username => _username.value;
  set username(value) => _username.value = value;

  @override
  void onInit() {
    ever(_authenticated, (value) {
      if (value != null) {
        username = 'Eduardo';
      }
    });
    super.onInit();
  }
}
