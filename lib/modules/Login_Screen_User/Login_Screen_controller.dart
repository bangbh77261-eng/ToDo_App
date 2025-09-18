import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app_sister/routers/app_router.dart';

class LoginScreenUserController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  // Reactive variables for UI state
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final SupabaseClient _supabase = Supabase.instance.client;

  // Login method with enhanced debugging
  Future<void> login() async {
    print('🚀 Starting login process...');

    // Validate input
    if (userName.text.isEmpty || userPassword.text.isEmpty) {
      print('❌ Validation failed: Empty fields');
      _showError('Vui lòng nhập đầy đủ thông tin');
      return;
    }

    print('📝 Username: ${userName.text.trim()}');
    print('📝 Password length: ${userPassword.text.trim().length}');

    try {
      isLoading.value = true;
      errorMessage.value = '';

      print('🔍 Querying database...');

      // Test connection first
      final testConnection = await _supabase
          .from('user_detail')
          .select('count')
          .count(CountOption.exact);

      print(
        '✅ Database connection successful. Total users: ${testConnection.count}',
      );

      // Query the user_detail table to check credentials
      print('🔎 Searching for user with username: ${userName.text.trim()}');

      final response = await _supabase
          .from('user_detail')
          .select('id, user_name, user_pasword,full_name,role')
          .eq('user_name', userName.text.trim())
          .eq('user_pasword', userPassword.text.trim())
          .maybeSingle();

      print('📊 Query response: $response');

      if (response != null) {
        print('✅ Login successful for user: ${response['user_name']}');
        _showSuccess('Đăng nhập thành công!');

        // Store user session data
        await _storeUserSession(response);

        // Navigate to home screen
        Get.toNamed(
          Routes.HOME_SCREEN,
          arguments: {
            'id': response['id'],
            'full_name': response['full_name'],
            'user_name': response['user_name'],
            'role': response['role'],
          },
        );
      } else {
        print('❌ Login failed: No matching user found');

        // Additional debug: Check if username exists
        final userCheck = await _supabase
            .from('user_detail')
            .select('user_name')
            .eq('user_name', userName.text.trim())
            .maybeSingle();

        if (userCheck != null) {
          print('🔍 Username exists but password mismatch');
          _showError('Mật khẩu không đúng');
        } else {
          print('🔍 Username not found in database');
          _showError('Tên đăng nhập không tồn tại');
        }
      }
    } on PostgrestException catch (e) {
      print('❌ PostgrestException: ${e.message}');
      print('❌ Error code: ${e.code}');
      print('❌ Error details: ${e.details}');
      _showError('Lỗi cơ sở dữ liệu: ${e.message}');
    } catch (e, stackTrace) {
      print('❌ Unexpected error: $e');
      print('❌ Stack trace: $stackTrace');
      _showError('Đã xảy ra lỗi: ${e.toString()}');
    } finally {
      isLoading.value = false;
      print('🏁 Login process completed');
    }
  }

  // Test database connection
  Future<void> testConnection() async {
    try {
      print('🧪 Testing database connection...');

      final response = await _supabase
          .from('user_detail')
          .select('id, user_name,full_name')
          .limit(5);

      print('✅ Connection successful. Sample data: $response');
      _showSuccess('Kết nối database thành công!');
    } catch (e) {
      print('❌ Connection failed: $e');
      _showError('Không thể kết nối database: $e');
    }
  }

  // Store user session data locally
  Future<void> _storeUserSession(Map<String, dynamic> userData) async {
    try {
      print('💾 Storing user session: $userData');
      Get.put(userData, tag: 'currentUser');
      print('✅ User session stored successfully');
    } catch (e) {
      print('❌ Failed to store user session: $e');
    }
  }

  // Show success message
  void _showSuccess(String message) {
    print('✅ Success: $message');
    Get.snackbar(
      'Thành công',
      message,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
    );
  }

  // Show error message
  void _showError(String message) {
    print('❌ Error: $message');
    errorMessage.value = message;
    Get.snackbar(
      'Lỗi',
      message,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 5),
    );
  }

  // Clear error message
  void clearError() {
    errorMessage.value = '';
  }

  @override
  void onClose() {
    userName.dispose();
    userPassword.dispose();
    super.onClose();
  }
}
