
import 'package:get/get.dart';
import 'package:todo_app_sister/modules/Login_Screen_User/Login_Screen_controller.dart';
class LoginScreenUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenUserController>(() => LoginScreenUserController());
  }
}