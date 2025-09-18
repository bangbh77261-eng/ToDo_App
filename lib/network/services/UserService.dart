import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; 
import 'package:todo_app_sister/routers/app_router.dart';
class UserService extends GetxService {
  final SupabaseClient _supabase = Supabase.instance.client;
  
  Rx<Map<String, dynamic>?> currentUser = Rx<Map<String, dynamic>?>(null);
  
  Future<UserService> init() async {
    return this;
  }
  
  void setCurrentUser(Map<String, dynamic> userData) {
    currentUser.value = userData;
  }
  
  void logout() {
    currentUser.value = null;
    Get.offAllNamed(Routes.LOGIN_SCREEN);
  }
  
  bool get isLoggedIn => currentUser.value != null;
}