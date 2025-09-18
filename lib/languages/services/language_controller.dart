import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static const String _languageKey = 'selected_language';
  
  final RxString currentLanguage = 'vi'.obs;
  
  // Static getter để truy cập dễ dàng
  static LanguageController get to => Get.find();
  
  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_languageKey) ?? 'vi';
    currentLanguage.value = savedLanguage;
    
    // Set locale based on saved language
    Locale locale = savedLanguage == 'vi' 
        ? const Locale('vi', 'VN') 
        : const Locale('en', 'US');
    
    Get.updateLocale(locale);
  }

  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
    
    currentLanguage.value = languageCode;
    
    Locale locale = languageCode == 'vi' 
        ? const Locale('vi', 'VN') 
        : const Locale('en', 'US');
    
    Get.updateLocale(locale);
    
    // Show success message
    Get.snackbar(
      'success'.tr,
      'language_changed_successfully'.tr,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.deepPurple,
      duration: const Duration(seconds: 2),
    );
  }

  List<Map<String, String>> get supportedLanguages => [
    {'code': 'vi', 'name': 'vietnamese'.tr, 'flag': '🇻🇳'},
    {'code': 'en', 'name': 'english'.tr, 'flag': '🇺🇸'},
  ];
}