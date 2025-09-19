import 'package:todo_app_sister/modules/Contact_Customer/Contact_Customer_controller.dart';
import 'package:get/get.dart';
class ContactCustomerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactCustomerController>(() =>ContactCustomerController());
  }
}