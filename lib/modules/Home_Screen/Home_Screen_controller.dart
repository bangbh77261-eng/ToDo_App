import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app_sister/network/models/user.dart';

class HomeScreenController extends GetxController {
  late UserModel currentUser;

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
}
