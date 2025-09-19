import 'package:get/get.dart';
import 'package:todo_app_sister/network/models/user.dart';
import 'package:todo_app_sister/routers/app_router.dart';

class HomeScreenController extends GetxController {
  late UserModel currentUser;
  
  // Thêm property cho navigation
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // Lấy arguments từ màn hình trước (Login)
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      currentUser = UserModel(
        id: args['id'] ?? 0,
        fullName: args['full_name'] ?? 'User',
        userName: args['user_name'] ?? '',
        role: args['role'] ?? 'No role',
      );
    }
  }
  
  void changeTabIndex(int index) {
    selectedIndex.value = index;
    if(index == 0){
      Get.toNamed(Routes.HOME_SCREEN);
    }else if(index == 1){
      Get.toNamed(Routes.HOME_SCREEN);
    }    
  }
}