import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  final _loginid = ''.obs;
  final _passwd = ''.obs;

  String get loginid => _loginid.value;
  set loginid(value) => _loginid.value = value;
  String get passwd => _passwd.value;
  set passwd(value) => _passwd.value = value;

  // static const storage = FlutterSecureStorage();

  // @override
  // void onInit() {
  //   super.onInit();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     loginState();
  //   });
  // }

  // loginState() async {
  //   String? userInfo = await storage.read(key: 'login');
  //   if (userInfo != null) {
  //     isLogin.value = true;
  //   }
  // }
}
