import 'package:get/get.dart';
import 'package:todo_app_sister/modules/Customer_Detail/Customer_Detail_controller.dart';
import 'package:todo_app_sister/modules/Home_Screen/Home_Screen_controller.dart';
class CustomerDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerDetailController>(() => CustomerDetailController());
  }
}