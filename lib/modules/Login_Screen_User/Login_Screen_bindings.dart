
import 'package:get/get.dart';

import 'Login_Screen_controller.dart';
class LoginScreenUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenUserController>(() => LoginScreenUserController());
  }
}