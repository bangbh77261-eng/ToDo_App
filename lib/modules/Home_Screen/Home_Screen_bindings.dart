import 'package:get/get.dart';
import 'package:todo_app_sister/modules/Home_Screen/Home_Screen_controller.dart';
class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}